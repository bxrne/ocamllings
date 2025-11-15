(** Delta Encoding and Decoding for Lists of Integers *)

(* Encode a list of integers using delta encoding *)
let encode lst =
  match lst with
  | [] -> []
  | x0 :: xs ->
    let rec aux prev acc = function
      | [] -> List.rev acc
      | x :: rest ->
        let d = x - prev in
        aux x (d :: acc) rest
    in
    x0 :: aux x0 [] xs

(* Decode a list of delta encoded integers *)
let decode lst =
  match lst with
  | [] -> []
  | x0 :: xs ->
    let rec aux prev acc = function
      | [] -> List.rev acc
      | d :: rest ->
        let x = prev + d in
        aux x (x :: acc) rest
    in
    x0 :: aux x0 [] xs

