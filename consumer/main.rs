#[macro_use]
extern crate log;
extern crate lapin;

use lapin::{Connection, ConnectionProperties, Result};
use std::env;

fn main() -> Result<()> {
    env::set_var("RUST_LOG","DEBUG");
    env_logger::init();
    // http://192.168.49.2:32329

    let addr = "amqp://192.168.49.2:32329/%2f".to_string();
    let conn = Connection::connect(
        &addr,
        ConnectionProperties::default(),
    ).wait().expect("connection");

    dbg!(&conn);

    let channel_a = conn.create_channel().wait().expect("channel a");

    dbg!(channel_a);

    info!("Hello from rust !");
    Ok(())
}