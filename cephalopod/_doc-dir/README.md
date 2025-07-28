# Cephalopod

An incomplete collection of tools to deal with ATproto and bluesky, in OCaml.
Currently, it has:

- `cephalopod`: a core library with the core types (dCBOR42, encoding to/from CBOR and JSON, CAR)
- `cephalopod.lexicon`: lexicon schemas a code generator that parses lexicon schemas and generates OCaml types
- `cephalopod-models`: code generated from the bsky and atproto lexicons
- `cephalopod-firehose-client`: a small tool to read from the firehose, mostly used for
    testing purpose so far.

The main part is really the core library and the lexicon-based code generator.

## Read from the firehose

```sh
$ ./scripts/firehose_client.sh --uri https://bsky.network/xrpc/com.atproto.sync.subscribeRepos
```
