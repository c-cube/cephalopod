open Cephalopod_dasl

let () =
  let file = Sys.argv.(1) in
  let content = CCIO.File.read_exn file in
  match Car.decode_string content with
  | Ok c ->
    Format.printf "car:@.%a@." Car.pp c;

    let content_sm =
      Car.encode_to_string { c with blocks = CCList.take 2 c.blocks }
    in
    CCIO.File.write_exn "small.car" content_sm;

    let content2 = Car.encode_to_string c in
    if content = content2 then
      Format.printf "re-encoded: match@."
    else (
      Format.printf "re-encoded: mismatch@.";
      CCIO.File.write_exn "mismatch.data" content2;
      exit 1
    )
  | Error err -> Format.printf "error:@.%a@." Car.pp_error_decode err
