open Cephalopod_dasl

let () =
  let file = Sys.argv.(1) in
  let content = CCIO.File.read_exn file in
  match Car.decode_string content with
  | Ok c -> Format.printf "car:@.%a@." Car.pp c
  | Error err -> Format.printf "error:@.%a@." Car.pp_error_decode err
