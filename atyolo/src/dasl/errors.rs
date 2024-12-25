#[derive(Debug, Clone, thiserror::Error)]
pub enum DaslError {
    #[error("Parse error: {0}")]
    ParseError(&'static str),
}

pub type Result<T> = std::result::Result<T, DaslError>;
