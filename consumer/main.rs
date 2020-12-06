mod amqp;

#[macro_use]
extern crate log;
extern crate lapin;

use lapin::{Connection, ConnectionProperties, Result, types::FieldTable, BasicProperties};
use std::env;
use lapin::options::{QueueDeclareOptions, BasicPublishOptions, BasicConsumeOptions, BasicAckOptions, BasicCancelOptions};
use lapin::message::DeliveryResult;
use std::str::from_utf8;
use futures::executor;
use std::thread::sleep;
use std::time::Duration;
use crate::amqp::AmqpCfg;

fn main() -> Result<()> {
    env::set_var("RUST_LOG","DEBUG");
    env_logger::init();

    let amqpCfg = AmqpCfg::new();
    dbg!(&amqpCfg);

    let conn = Connection::connect(
        &amqpCfg.url(),
        ConnectionProperties::default(),
    ).wait().expect("connection");

    let receive = conn.create_channel().wait().expect("create receive channel");

    dbg!(&receive);

    let mut consumer = receive.basic_consume(
        "data",
        "",
        BasicConsumeOptions::default(),
        FieldTable::default(),
    )
        .wait()
        .expect("basic consume");

    dbg!(&consumer);

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

    println!("exit");

    // let mut it = consumer.into_iter();
    // let (_,delivery) = it.next().expect("delivery").expect("delivery");
    // let ack = executor::block_on(delivery.ack(BasicAckOptions::default()));
    // info!("{}", from_utf8(&delivery.data).unwrap());
    //
    // loop {
    //     info!("Hello from rust !!");
    //     sleep(Duration::from_secs(1));
    // }
    Ok(())
}