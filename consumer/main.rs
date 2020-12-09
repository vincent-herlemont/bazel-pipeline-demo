mod amqp;
mod pg;
mod data;
mod error;
mod result;

#[macro_use]
extern crate log;
extern crate lapin;
extern crate thiserror;

use lapin::{Connection, ConnectionProperties, types::FieldTable, BasicProperties};
use std::env;
use lapin::options::{QueueDeclareOptions, BasicPublishOptions, BasicConsumeOptions, BasicAckOptions, BasicCancelOptions, BasicRejectOptions};
use lapin::message::DeliveryResult;
use std::str::from_utf8;
use futures::executor;
use std::thread::sleep;
use std::time::Duration;
use crate::amqp::AmqpCfg;
use crate::pg::PgCfg;
use postgres::{Client, NoTls};
use result::Result;
use data::Data;
use crate::error::MainError;


fn process_data(data: &[u8], pg_client: &mut Client) -> Result<()> {
    let data:i32 = Data::from_bytes(data)?.into();
    pg_client.execute(
        "INSERT INTO data (n) VALUES ($1)",
        &[&data],
    )?;
    Ok(())
}

fn main() -> Result<()> {
    env::set_var("RUST_LOG","DEBUG");
    env_logger::init();

    let pg_url = PgCfg::new().connection_string();
    info!("pg_url {}", &pg_url);

    let mut client = Client::connect(&pg_url, NoTls)?;

    let amqp_url = AmqpCfg::new().url();
    info!("amqp_url {}", &amqp_url);

    let conn = Connection::connect(
        &amqp_url,
        ConnectionProperties::default(),
    ).wait()?;

    info!("connection amqp ok");

    let receive = conn.create_channel().wait()?;

    info!("create receive channel ok");

    let mut consumer = receive.basic_consume(
        "data",
        "",
        BasicConsumeOptions::default(),
        FieldTable::default(),
    )
        .wait()?;

    info!("create consumer ok");

    for delivery in consumer.into_iter() {
        match delivery {
            Ok((c,delivery)) => {
                if !&c.status().connected() {
                    return Err(MainError::LapinDisconnected)
                }
                if let Err(MainError::Pg(err)) = process_data(&delivery.data, &mut client) {
                    executor::block_on(delivery.reject(BasicRejectOptions{requeue:true}))?;
                    return Err(MainError::Pg(err));
                } else {
                    executor::block_on(delivery.ack(BasicAckOptions::default()))?;
                }
            },
            Err(err) => {
                return Err(MainError::Lapin(err));
            }
        }
    }

    info!("exit consumer");
    
    Ok(())
}