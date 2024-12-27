//! Simple implementation for <https://dasl.ing/>.
//!
//! This module provides the basic building blocks for
//! distributed content-addressed applications.

pub mod car;
pub mod cid;
pub mod data;
pub mod dcbor42;
pub mod errors;
mod utils;

pub use data::Value;
pub use errors::{DaslError, Result};
