module Q = QCheck2
open Cephalopod_dasl

let t_encode_decode =
  Q.Test.make ~name:__FUNCTION__ ~print:Car.show Util.U_car.gen (fun car ->
      let str = Car.encode_to_string car in
      match Car.decode_string str with
      | Ok c2 when Car.equal car c2 -> true
      | Ok c2 ->
        Q.Test.fail_reportf "car: %a, decode(encode(v)): %a" Car.pp car Car.pp
          c2
      | Error err ->
        Q.Test.fail_reportf "cannot parse CAR back: %a" Car.pp_error_decode err)

let () = QCheck_base_runner.run_tests_main [ t_encode_decode ]
