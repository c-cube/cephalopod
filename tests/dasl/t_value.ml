module Q = QCheck2
open Cephalopod_dasl

let t_encode_decode_cbor =
  Q.Test.make ~name:__FUNCTION__ ~print:Value.show Util.U_value.gen (fun v ->
      let str = Value.to_cbor_str v in
      match Value.parse_cbor_str str with
      | Ok v2 when Value.equal v v2 -> true
      | Ok v2 ->
        Q.Test.fail_reportf "v: %a, decode(encode(v)): %a" Value.pp v Value.pp
          v2
      | Error err ->
        Q.Test.fail_reportf "cannot parse value back: %a" Value.pp_error_of_cbor
          err)

type padding = {
  pre_len: (int[@gen Q.Gen.small_nat]);
  pre_fill: char;
  post_len: (int[@gen Q.Gen.small_nat]);
  post_fill: char;
}
[@@deriving show, qcheck2]

let t_encode_decode_cbor_slice =
  Q.Test.make ~name:__FUNCTION__ ~long_factor:10
    ~print:CCFormat.(to_string (Dump.pair pp_padding Value.pp))
    Q.Gen.(pair gen_padding Util.U_value.gen)
    (fun (padding, v) ->
      let str = Value.to_cbor_str v in
      let str_len = String.length str in
      let str =
        String.make padding.pre_len padding.pre_fill
        ^ str
        ^ String.make padding.post_len padding.post_fill
      in
      match Value.parse_cbor_str ~off:padding.pre_len ~len:str_len str with
      | Ok v2 when Value.equal v v2 -> true
      | Ok v2 ->
        Q.Test.fail_reportf "v: %a, decode(encode(v)): %a" Value.pp v Value.pp
          v2
      | Error err ->
        Q.Test.fail_reportf "cannot parse value back: %a" Value.pp_error_of_cbor
          err)

let t_encode_decode_json =
  Q.Test.make ~name:__FUNCTION__ ~print:Value.show Util.U_value.gen (fun v ->
      let j = Value.to_yojson v in
      match Value.of_yojson j with
      | Ok v2 when Value.equal v v2 -> true
      | Ok v2 ->
        Q.Test.fail_reportf "v: %a, decode(encode(v)): %a" Value.pp v Value.pp
          v2
      | Error err -> Q.Test.fail_reportf "cannot parse value back: %s" err)

let () =
  QCheck_base_runner.run_tests_main
    [ t_encode_decode_cbor; t_encode_decode_cbor_slice; t_encode_decode_json ]
