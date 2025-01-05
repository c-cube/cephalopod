//! Core definitions for XRPC

use crate::data::Encodable;

/// A XRPC query
pub trait Query {
    type Params: for<'a> Encodable<'a>;
    type Input: for<'a> Encodable<'a>;
    type Output: for<'a> Encodable<'a>;
    type Error;
}

/// A XRPC procedure
pub trait Procedure {
    type Params: for<'a> Encodable<'a>;
    type Input: for<'a> Encodable<'a>;
    type Output: for<'a> Encodable<'a>;
    type Error;
}

/// A XRPC subscription (websocket)
pub trait Subscription {
    type Message: for<'a> Encodable<'a>;
    type Error;
}
