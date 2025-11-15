open Alcotest

let () =
  run "Tests" [
    ("Compression", [
      test_case "test_encode_decode_rle" `Quick Test_rle.test_rle;
      test_case "test_encode_decode_delta" `Quick Test_delta.test_delta;
    ]);

    ("Streams", [
      test_case "test_lazyfib" `Quick Test_lazyfib.test_fib; 
    ]);

    ("Data Structures", [
      test_case "test_stack" `Quick Test_stack.test_stack;
    ]);
  ]
