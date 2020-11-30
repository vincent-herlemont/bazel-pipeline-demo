#[macro_use]
extern crate log;

use std::env;

fn main() {
    env::set_var("RUST_LOG","DEBUG");
    env_logger::init();
    info!("Hello from rust !");
    warn!("/!\\Hello from rust !!");
    println!("Hello from rust !!!")
}