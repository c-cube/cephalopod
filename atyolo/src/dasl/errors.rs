#[derive(Debug, Clone, thiserror::Error)]
pub enum DaslError {
    #[error("Parse error: {0}")]
    ParseError(&'static str),
    #[error("Invalid dCBOR42: {0}")]
    InvalidDCBOR42(&'static str),
    #[error("AllocationError")]
    AllocError,
}

pub type Result<T> = std::result::Result<T, DaslError>;

impl From<bumpalo::AllocErr> for DaslError {
    fn from(_value: bumpalo::AllocErr) -> Self {
        DaslError::AllocError
    }
}
