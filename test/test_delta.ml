open Alcotest

open Delta

(* Given a set of integer lists and their expected delta encodings, test the encode and decode functions *)
let test_delta () =
  let test_cases = [
    ([], []);
    ([5], [5]);
    ([10; 20; 30; 40], [10; 10; 10; 10]);
    ([100; 90; 80; 70], [100; -10; -10; -10]);
    ([1; 1; 1; 1], [1; 0; 0; 0]);
    ([0; 5; 15; 30], [0; 5; 10; 15]);
  ] in 
  List.iter (fun (input, expected_encoding) ->
    let encoded = encode input in
    let expected_decoded = decode expected_encoding in
    let decoded = decode encoded in 
    (* is the expected_encoding the output of encoding input? *)
    check (list int) "Encoding matches expected" expected_encoding encoded;
    (* is decoding expected_encoding the same as input? *)
    check (list int) "Decoding expected encoding matches input" input expected_decoded;
    (* is decoding(encoding(input)) the same as input? *)
    check (list int) "Decoding(Encoding(input)) matches input" input decoded;
  ) test_cases

