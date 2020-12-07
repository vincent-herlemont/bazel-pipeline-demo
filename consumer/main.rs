mod amqp;
mod pg;

#[macro_use]
extern crate log;
extern crate lapin;
extern crate thiserror;

use lapin::{Connection, ConnectionProperties, types::FieldTable, BasicProperties};
use std::env;
use lapin::options::{QueueDeclareOptions, BasicPublishOptions, BasicConsumeOptions, BasicAckOptions, BasicCancelOptions};
use lapin::message::DeliveryResult;
use std::str::from_utf8;
use futures::executor;
use std::thread::sleep;
use std::time::Duration;
use crate::amqp::AmqpCfg;
use crate::pg::PgCfg;
use postgres::{Client, NoTls};
use thiserror::Error;

#[derive(Error, Debug)]
pub enum MainError {
    #[error("amqp")]
    Lapin(#[from] lapin::Error),
    #[error("pg")]
    Pg(#[from] postgres::Error),
}

pub type Result<T> = std::result::Result<T, MainError>;

fn main() -> Result<()> {
    env::set_var("RUST_LOG","DEBUG");
    env_logger::init();

    let pgUrl = PgCfg::new().connection_string();
    info!("pgUrl {}", &pgUrl);

    let mut client = Client::connect(&pgUrl, NoTls)?;

    let amqpUrl = AmqpCfg::new().url();
    info!("amqpUrl {}", &amqpUrl);

    let conn = Connection::connect(
        &amqpUrl,
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
            Ok((_,delivery)) => {
                if let Ok(_) = executor::block_on(delivery.ack(BasicAckOptions::default())) {
                    info!("ACK ok")
                } else {
                    error!("ACK fail")
                }
                match from_utf8(&delivery.data) {
                    Ok(s) => {
                        match s.parse::<i32>() {
                            Ok(i)=> {
                                if let Err(err) = client.execute(
                                    "INSERT INTO data (n) VALUES ($1)",
                                    &[&i],
                                ) {
                                    error!("insert error : {:?}",err);
                                }
                            }
                            Err(err) => error!("parse err : {:?}", err)
                        };
                        info!("consumer data : {}",s)
                    }
                    Err(err) => {
                        error!("utf8 err : {:?}", err)
                    }
                };
            },
            Err(err) => {
                error!("lapin err : {:?}",err)
            }
        }
    }

    info!("exit consumer");
    
    Ok(())
}