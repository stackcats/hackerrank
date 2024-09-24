let is_prime n =
  let m = float_of_int n |> sqrt |> ceil |> int_of_float in
  let rec f x =
    if x > m then true else if n mod x = 0 then false else f @@ succ x
  in
  if n < 2 then false else if n = 2 then true else f 2

let rec is_right n =
  if n = 0 then true else if is_prime n then is_right @@ (n / 10) else false

let rec is_left n =
  if is_prime n then
    if n < 10 then true
    else
      let s = string_of_int n in
      String.sub s 1 (String.length s - 1) |> int_of_string |> is_left
  else false

let has_zero n = String.contains (string_of_int n) '0'

let classify n =
  if has_zero n then "DEAD"
  else
    match (is_left n, is_right n) with
    | true, true -> "CENTRAL"
    | true, _ -> "LEFT"
    | _, true -> "RIGHT"
    | _ -> "DEAD"

let () =
  let t = read_int () in
  for _ = 1 to t do
    read_int () |> classify |> print_endline
  done
