use thiserror::Error;

#[derive(Error, Debug)]
pub enum MainError {
    #[error("amqp")]
    Lapin(#[from] lapin::Error),
    #[error("amqp channel disconnected")]
    LapinDisconnected,
    #[error("pg")]
    Pg(#[from] postgres::Error),
    #[error("Parse to int error")]
    ParseToInt(#[from] std::num::ParseIntError),
    #[error("Parse to utf8 error")]
    ParseUtf8(#[from] std::str::Utf8Error)
}
