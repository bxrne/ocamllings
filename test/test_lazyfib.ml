open Alcotest 

open Lazyfib

let test_fib () = 
  let simple = Seq.take 10 (fun () -> lazyfib 0 1) |> List.of_seq in 
  let expected = [0; 1; 1; 2; 3; 5; 8; 13; 21; 34] in
  check (list int) "first 10 fib numbers" expected simple 

