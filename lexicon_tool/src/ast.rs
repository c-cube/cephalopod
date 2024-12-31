//! Lexicons
//!
//! https://atproto.com/specs/lexicon

use std::collections::HashMap;

use serde::Deserialize;

#[derive(Debug)]
pub enum TypeExpr {
    String,
    Boolean,
    Integer,
    Bytes,
    Array { items: Vec<TypeExpr> },
}

#[derive(Debug, Deserialize)]
#[serde(rename_all = "kebab-case")]
pub enum StringFormat {
    AtIdentifier,
    AtUri,
    Cid,
    Datetime,
    Did,
    Handle,
    Nsid,
    Tid,
    RecordKey,
    Uri,
    Language,
}

#[derive(Debug, Deserialize)]
#[serde(tag = "type", rename_all = "lowercase")]
pub enum Type {
    Null {
        description: Option<String>,
    },
    Boolean {
        default: Option<bool>,
        description: Option<String>,
    },
    Integer {
        description: Option<String>,
        minimum: Option<i64>,
        maximum: Option<i64>,
        #[serde(rename = "enum")]
        enum_: Option<Vec<i64>>,
        default: Option<i64>,
        #[serde(rename = "const")]
        const_: Option<i64>,
    },
    String {
        description: Option<String>,
        format: Option<StringFormat>,
        minLength: Option<usize>,
        maxLength: Option<usize>,
        #[serde(rename = "enum")]
        enum_: Option<Vec<String>>,
        default: Option<String>,
        #[serde(rename = "const")]
        const_: Option<String>,
    },
    Bytes {
        description: Option<String>,
        minLength: Option<usize>,
        maxLength: Option<usize>,
    },
    #[serde(rename = "cid-link")]
    CidLink {
        description: Option<String>,
    },
    Array {
        items: Box<Type>,
        minLength: Option<usize>,
        maxLength: Option<usize>,
    },
    Object(Object),
    Blob {
        description: Option<String>,
        accept: Option<String>,
        maxSize: Option<usize>,
    },
    Token {
        description: Option<String>,
    },
    Ref {
        /// Reference to another definition
        #[serde(rename = "ref")]
        ref_: String,
    },
    Union(Union),
    Unknown,
}

#[derive(Debug, Deserialize)]
pub struct Error {
    pub description: Option<String>,
    pub name: String,
}

#[derive(Debug, Deserialize)]
pub struct Object {
    pub description: Option<String>,
    // pub fragment: String,
    pub required: Option<Vec<String>>,
    nullable: Option<Vec<String>>,
    pub properties: HashMap<String, Type>,
}

#[derive(Debug, Deserialize)]
pub struct Union {
    pub description: Option<String>,
    pub refs: Vec<String>,
    #[serde(default)]
    pub closed: bool,
}

#[derive(Debug, Deserialize)]
pub struct Params {
    pub description: Option<String>,
    pub required: Option<Vec<String>>,
    pub properties: HashMap<String, Type>,
}

#[derive(Debug, Deserialize)]
pub enum Encoding {
    #[serde(rename = "application/json")]
    Json,
    #[serde(untagged)]
    Other(String),
}

#[derive(Debug, Deserialize)]
pub struct InputOrOutput {
    pub description: Option<String>,
    pub encoding: Encoding,
    pub schema: Option<Type>,
}

#[derive(Debug, Deserialize)]
pub struct Query {
    pub description: Option<String>,
    pub parameters: Option<Params>,
    pub output: Option<InputOrOutput>,
    pub errors: Option<Vec<Error>>,
}

#[derive(Debug, Deserialize)]
pub struct Procedure {
    pub description: Option<String>,
    pub parameters: Option<Params>,
    pub input: Option<InputOrOutput>,
    pub output: Option<InputOrOutput>,
    pub errors: Option<Vec<Error>>,
}

#[derive(Debug, Deserialize)]
pub struct Message {
    pub description: Option<String>,
    pub schema: Type,
}

#[derive(Debug, Deserialize)]
pub struct Subscription {
    pub description: Option<String>,
    pub parameters: Option<Params>,
    pub message: Option<Message>,
    pub errors: Option<Vec<Error>>,
}

#[derive(Debug, Deserialize)]
pub struct Record {
    pub description: Option<String>,
    pub key: String,
    pub record: Object,
}

#[derive(Debug, Deserialize)]
#[serde(tag = "type", rename_all = "lowercase")]
pub enum Def {
    Object(Object),
    Query(Query),
    Procedure(Query),
    Record(Record),
    Subscription(Subscription),
    #[serde(other)]
    Other,
}

#[derive(Debug, Deserialize)]
pub struct Lexicon {
    pub description: Option<String>,
    pub id: String,
    // must be 1
    pub lexicon: i32,
    pub defs: HashMap<String, Def>,
}

impl Def {
    pub fn is_other(&self) -> bool {
        match self {
            Def::Other => true,
            _ => false,
        }
    }
}
