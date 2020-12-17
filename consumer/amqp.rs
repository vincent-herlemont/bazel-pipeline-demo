use std::env;


#[derive(Debug)]
pub struct AmqpCfg {
    host: String,
    port: String,
    user: String,
    password: String,
}

impl AmqpCfg {
    pub fn new() -> AmqpCfg {
        AmqpCfg {
            host: env::var("AMQP_HOST").expect("amqp host"),
            port: env::var("AMQP_PORT").expect("amqp port"),
            user: env::var("AMQP_USER").expect("amqp user"),
            password: env::var("AMQP_PASSWORD").expect("amqp password"),
        }
    }

    pub fn url(self) -> String {
        format!("amqp://{}:{}@{}:{}/%2f",self.user,self.password,self.host,self.port)
    }

}

#[cfg(test)]
mod test {
    use super::AmqpCfg;
    use std::env;

    #[test]
    fn test_amqp_cfg() {
        env::set_var("AMQP_HOST","localhost");
        env::set_var("AMQP_PORT","5672");
        env::set_var("AMQP_USER","guest");
        env::set_var("AMQP_PASSWORD","pwd");
        let amqp_cfg = AmqpCfg::new();
        assert_eq!("amqp://guest:pwd@localhost:5672/%2f", amqp_cfg.url());
    }
}