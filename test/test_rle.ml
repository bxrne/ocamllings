open Alcotest

open Rle 

(* Given a set of strings and their expected RLE encodings, test the encode and decode functions *)
let test_rle () =
  let test_cases = [
    ("", []);
    ("A", [('A', 1)]);
    ("AAABBBCCDAA", [('A', 3); ('B', 3); ('C', 2); ('D', 1); ('A', 2)]);
    ("WWWWWWWWWWWWBWWWWWWWWWWWW", [('W', 12); ('B', 1); ('W', 12)]);
    ("XYZ", [('X', 1); ('Y', 1); ('Z', 1)]);
    ("AABBAA", [('A', 2); ('B', 2); ('A', 2)]);
  ] in 
  List.iter (fun (input, expected_encoding) ->
    let encoded = encode input in
    let expected_decoded = decode expected_encoding in
    let decoded = decode encoded in 
    (* is the expected_encoding the output of encoding input? *)
    check (list (pair char int)) "Encoding matches expected" expected_encoding encoded;
    (* is decoding expected_encoding the same as input? *)
    check string "Decoding expected encoding matches input" input expected_decoded;
    (* is decoding(encoding(input)) the same as input? *)
    check string "Decoding(Encoding(input)) matches input" input decoded;
  ) test_cases 



