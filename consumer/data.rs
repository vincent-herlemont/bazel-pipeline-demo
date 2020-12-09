use crate::Result;
use std::str::from_utf8;

#[derive(Debug)]
pub struct Data(i32);

impl Data {
    pub fn from_bytes(bytes: &[u8]) -> Result<Data> {
        let value = from_utf8(bytes)?;
        Data::from_str(value)
    }

    pub fn from_str(str: &str) -> Result<Data> {
        let value: i32 = str.parse()?;
        Ok(Data(value))
    }
}

impl From<Data> for i32 {
    fn from(data: Data) -> Self {
        data.0
    }
}

#[cfg(test)]
mod test {
    use crate::data::Data;
    use crate::result::Result;

    #[test]
    fn new_data_from_bytes() -> Result<()> {
        let b = "2".to_string().into_bytes();
        let data = Data::from_bytes(&b)?;
        assert_eq!(data.0,2);
        Ok(())
    }

    #[test]
    fn new_data_from_str() -> Result<()> {
        let data = Data::from_str("2")?;
        assert_eq!(data.0,2);
        Ok(())
    }

    #[test]
    fn new_data_from_str_fail() {
        if let Ok(_) = Data::from_str("a") {
            assert!(false);
        }
    }
}