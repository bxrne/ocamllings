open Alcotest 

open Lib 

let test_stack () =
  let s = Stack.create () in 
  let s = Stack.push s 1 in 
  let s = Stack.push s 2 in 
  let s = Stack.push s 3 in 

  match Stack.pop s with 
  | None -> fail "Pop from non-empty stack returned None"
  | Some s1 -> 
      match Stack.pop s1 with 
      | None -> fail "Pop from non-empty stack returned None"
      | Some s2 -> 
          match Stack.pop s2 with 
          | None -> fail "Pop from non-empty stack returned None"
          | Some s3 -> 
              match Stack.pop s3 with 
              | None -> ()  (* Expected, stack should be empty now *)
              | Some _ -> fail "Pop from empty stack did not return None"

