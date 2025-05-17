open Cephalopod_dasl

let () =
  let file = Sys.argv.(1) in
  let content = CCIO.File.read_exn file in
  let t0 = Unix.gettimeofday () in
  let _N = 20_000 in
  for _i = 1 to _N do
    ignore (Sys.opaque_identity (Car.decode_string content))
  done;
  let t1 = Unix.gettimeofday () in
  Format.eprintf "decode: %.8f ms/iter@." ((t1 -. t0) *. 1000. /. float _N)
