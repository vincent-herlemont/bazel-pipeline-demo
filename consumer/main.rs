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

fn main() -> Result<()> {
    env::set_var("RUST_LOG","DEBUG");
    env_logger::init();
    let host = env::var("AMQP_HOST").expect("AMQP_HOST"); // "amqp://192.168.49.2:32329/%2f".to_string();
    let port = env::var("AMQP_PORT").expect("AMQP_PORT"); // "amqp://192.168.49.2:32329/%2f".to_string();
    let addr = format!("amqp://{}:{}/%2f",host,port);
    dbg!(&addr);

    let conn = Connection::connect(
        &addr,
        ConnectionProperties::default(),
    ).wait().expect("connection");

    dbg!(&conn);

    let send = conn.create_channel().wait().expect("create send channel");
    let receive = conn.create_channel().wait().expect("create receive channel");

    let queue = send
        .queue_declare("hello", QueueDeclareOptions::default(), FieldTable::default())
        .wait()
        .expect("declare queue hello");

    let payload = b"Message from rabbitmq";
    let confirm = send.basic_publish(
      "",
        "hello",
        BasicPublishOptions::default(),
        payload.to_vec(),
        BasicProperties::default(),
    )
        .wait()
        .expect("basic publish")
        .wait()
        .expect("confirmation");

    dbg!(confirm);

    let mut consumer = receive.basic_consume(
        "hello",
        "hello_consumer",
        BasicConsumeOptions::default(),
        FieldTable::default(),
    )
        .wait()
        .expect("basic consume");

    let mut it = consumer.into_iter();
    let (_,delivery) = it.next().expect("delivery").expect("delivery");
    let ack = executor::block_on(delivery.ack(BasicAckOptions::default()));
    info!("{}", from_utf8(&delivery.data).unwrap());

    loop {
        info!("Hello from rust !!");
        sleep(Duration::from_secs(1));
    }
    Ok(())
}