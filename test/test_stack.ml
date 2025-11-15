open Alcotest 

open Stack 

let test_stack () =
  let s = create () in 
  let s = push s 1 in 
  let s = push s 2 in 
  let s = push s 3 in 

  match pop s with 
  | None -> fail "Pop from non-empty stack returned None"
  | Some s1 -> 
      match pop s1 with 
      | None -> fail "Pop from non-empty stack returned None"
      | Some s2 -> 
          match pop s2 with 
          | None -> fail "Pop from non-empty stack returned None"
          | Some s3 -> 
              match pop s3 with 
              | None -> ()  (* Expected, stack should be empty now *)
              | Some _ -> fail "Pop from empty stack did not return None"

