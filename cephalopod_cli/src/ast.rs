//! Lexicons
//!
//! https://atproto.com/specs/lexicon

#![allow(non_snake_case, unused)]

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
#[serde(untagged)]
pub enum Accept {
    Accept1(String),
    AcceptN(Vec<String>),
}

#[derive(Debug, Deserialize)]
pub struct StringTy {
    pub description: Option<String>,
    pub format: Option<StringFormat>,
    pub minLength: Option<usize>,
    pub maxLength: Option<usize>,
    #[serde(rename = "enum")]
    pub enum_: Option<Vec<String>>,
    pub default: Option<String>,
    #[serde(rename = "const")]
    pub const_: Option<String>,
    pub knownValues: Option<Vec<String>>,
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
    String(StringTy),
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
        accept: Option<Accept>,
        maxSize: Option<usize>,
    },
    Token(Token),
    Ref {
        /// Reference to another definition
        #[serde(rename = "ref")]
        ref_: String,
    },
    Union(Union),
    Unknown,
}

impl Type {
    pub fn description(&self) -> Option<&str> {
        match self {
            Type::Null { description }
            | Type::Boolean { description, .. }
            | Type::Integer { description, .. }
            | Type::String(StringTy { description, .. })
            | Type::Bytes { description, .. }
            | Type::CidLink { description }
            | Type::Blob { description, .. } => description.as_deref(),
            Type::Token(t) => t.description.as_deref(),
            Type::Object(o) => o.description.as_deref(),
            Type::Ref { .. } | Type::Union(_) | Type::Unknown | Type::Array { .. } => None,
        }
    }

    pub fn known_values(&self) -> Option<&[String]> {
        match self {
            Type::String(s) => s.knownValues.as_deref(),
            _ => None,
        }
    }
}

#[derive(Debug, Deserialize)]
pub struct Error {
    pub description: Option<String>,
    pub name: String,
}

#[derive(Debug, Deserialize)]
pub struct Token {
    pub description: Option<String>,
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
    #[serde(rename = "application/vnd.ipld.car")]
    CAR,
    #[serde(untagged)]
    Other(String),
}

impl Encoding {
    /// Mime type for this encoding    
    pub fn to_mime(&self) -> &str {
        use Encoding::*;
        match self {
            Json => "application/json",
            CAR => "application/vnd.ipld.car",
            Other(s) => &s,
        }
    }
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
    Query(Query),
    Procedure(Procedure),
    Record(Record),
    Subscription(Subscription),
    Object(Object),
    #[serde(untagged)]
    Type(Type),
}

#[derive(Debug, Deserialize)]
pub struct Lexicon {
    pub description: Option<String>,
    pub id: String,
    // must be 1
    pub lexicon: i32,
    pub defs: HashMap<String, Def>,
}
