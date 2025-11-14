open Alcotest
open Test_rle

let () =
  run "Tests" [
    ("RLE", [
      test_case "test_encode_decode_rle" `Quick test_rle;
    ]);
  ]
