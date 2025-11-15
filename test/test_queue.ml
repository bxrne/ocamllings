open Alcotest

open Lib

let test_queue () =
  let test_cases = [
    ([], []);
    ([1], [1]);
    ([1; 2; 3; 4; 5], [1; 2; 3; 4; 5]);
    ([10; 20; 30], [10; 20; 30]);
  ] in 
  List.iter (fun (input, expected_output) ->
    let q = List.fold_left Queue.enqueue (Queue.create ()) input in
    let rec dequeue_all q acc =
      match Queue.dequeue q with
      | None -> List.rev acc
      | Some (value, q') -> dequeue_all q' (value :: acc)
    in
    let output = dequeue_all q [] in
    check (list int) "Dequeued elements match expected output" expected_output output;
  ) test_cases
