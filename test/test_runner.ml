open Alcotest

let () =
  run "Tests" [
    ("RLE", [
      test_case "test_encode_decode_rle" `Quick Test_rle.test_rle;
      test_case "test_encode_decode_delta" `Quick Test_delta.test_delta;
    ]);
  ]
