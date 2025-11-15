(** Stack implementation using linked lists *)

(* Simple stack def *)
type 'a stack = Empty | Node of 'a * 'a stack

(* Create an empty stack *)
let create () : 'a stack = Empty 

(* Push an element onto the stack *)
let push (s: 'a stack) (x: 'a) : 'a stack =
  Node (x, s)

(* Pop an element from the stack *)
let pop (s: 'a stack) : 'a stack option =
  match s with
  | Empty -> None 
  | Node(_, tail) -> Some(tail)



