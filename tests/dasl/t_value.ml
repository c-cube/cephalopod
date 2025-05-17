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
    [ t_encode_decode_cbor; t_encode_decode_json ]
