use std::io;

#[derive(Debug, thiserror::Error)]
pub enum DaslError {
    #[error("Parse error: {0}")]
    ParseError(&'static str),
    #[error("Invalid dCBOR42: {0}")]
    InvalidDCBOR42(&'static str),
    #[error("AllocationError")]
    AllocError,
    #[error("Encoding error for DCBOR42: {0}")]
    DCBOR42EncodingError(&'static str),
    #[error("Invalid CAR: {0}")]
    InvalidCAR(&'static str),
    #[error("IO error: {0}")]
    IOError(#[from] io::Error),
}

pub type Result<T> = std::result::Result<T, DaslError>;

impl From<bumpalo::AllocErr> for DaslError {
    fn from(_value: bumpalo::AllocErr) -> Self {
        DaslError::AllocError
    }
}
