use serde::{Deserialize, Serialize};

/// A XRPC query
pub trait Query {
    type Params: Serialize + Deserialize;
    type Input: Serialize + Deserialize;
    type Output: Serialize + Deserialize;
    type Error;
}

/// A XRPC procedure
pub trait Procedure {
    type Params: Serialize + Deserialize;
    type Input: Serialize + Deserialize;
    type Output: Serialize + Deserialize;
    type Error;
}

/// A XRPC subscription (websocket)
pub trait Subscription {
    type Message: Serialize + Deserialize;
    type Error;
}
