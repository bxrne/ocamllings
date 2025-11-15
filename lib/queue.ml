(** Efficient functional queue using two lists *)

type 'a queue = {
  front : 'a list;   (* elements ready to dequeue *)
  back  : 'a list;   (* elements pushed, in reverse order *)
}

(* Create an empty queue *)
let create () : 'a queue =
  { front = []; back = [] }

(* Normalize: if front is empty, flip back *)
let normalize q =
  match q.front with
  | [] -> { front = List.rev q.back; back = [] }
  | _ -> q

(* Enqueue: push onto back *)
let enqueue q x =
  normalize { q with back = x :: q.back }

(* Dequeue: pop from front *)
let dequeue q =
  match q.front with
  | [] ->
      (* Normalize then retry *)
      let q' = normalize q in
      (match q'.front with
       | [] -> None
       | h :: t -> Some (h, normalize { q' with front = t }))
  | h :: t ->
      Some (h, normalize { q with front = t })
