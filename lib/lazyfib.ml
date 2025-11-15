(* Lazy Fibonacci sequnce generator *)

(* Generate an infinite lazy Fibonacci sequence *)
let rec lazyfib a b = 
  Seq.Cons (a, fun () -> lazyfib b (a + b))

