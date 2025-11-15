(** Run-Length Encoding (RLE) *)

(*
    Run-Length Encoding is a simple form of data compression where consecutive
    identical elements are stored as a single element and a count. For example,
    the string "aaabbbccdaa" would be encoded as [('a', 3); ('b', 3); ('c', 2); ('d', 1); ('a', 2)].
*)

(* Decode a run-length encoded list of (char, count) pairs *)
let decode (pairs : (char * int) list) : string =
  let buf = Buffer.create 16 in
  List.iter (fun (c, n) ->
    for _ = 1 to n do Buffer.add_char buf c done
  ) pairs;
  Buffer.contents buf

(* Run-length encode a string *)
let encode (s: string): (char * int) list =
  let rec aux i current_char count acc =
    if i = String.length s then
      List.rev ((current_char, count) :: acc)
    else
      let c = s.[i] in
      if c = current_char then
        aux (i + 1) current_char (count + 1) acc
      else
        aux (i + 1) c 1 ((current_char, count) :: acc)
  in
  if s = "" then [] else aux 1 s.[0] 1 []
