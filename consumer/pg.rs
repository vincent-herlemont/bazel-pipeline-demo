use std::env;

#[derive(Debug)]
pub struct PgCfg {
    host : String,
    port : String,
    user : String,
    password : String,
    dbname: String,
}

impl PgCfg {

    pub fn new() -> PgCfg {
        PgCfg {
            host: env::var("PG_HOST").expect("pg host"),
            port: env::var("PG_PORT").expect("pg port"),
            user: env::var("PG_USER").expect("pg user"),
            password: env::var("PG_PASSWORD").expect("pg password"),
            dbname: env::var("PG_DBNAME").expect("pg dbname"),
        }
    }

    pub fn connection_string(self) -> String {
        format!(
            "host={host} port={port} user={user} password={password} dbname={dbname}",
            host=self.host,
            port=self.port,
            user=self.user,
            password=self.password,
            dbname=self.dbname,
        )
    }
}

#[cfg(test)]
mod test {
    use std::env;
    use super::PgCfg;

    #[test]
    fn test_pg_cfg() {
        env::set_var("PG_HOST", "localhost");
        env::set_var("PG_PORT", "5432");
        env::set_var("PG_USER", "pgadmin");
        env::set_var("PG_PASSWORD", "pgpwd");
        env::set_var("PG_DBNAME", "test");
        let pgCfg = PgCfg::new();
        assert_eq!("host=localhost port=5432 user=pgadmin password=pgpwd dbname=test", pgCfg.connection_string())
    }
}