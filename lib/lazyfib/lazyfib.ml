(* Lazy Fibonacci sequnce generator *)

let rec lazyfib a b = 
  Seq.Cons (a, fun () -> lazyfib b (a + b))

