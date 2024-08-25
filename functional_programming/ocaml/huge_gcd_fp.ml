let factors n =
  let lst = ref [] and i = ref 2 and m = ref n in
  while !m >= !i do
    if !m mod !i = 0 then (
      lst := !i :: !lst;
      m := !m / !i)
    else i := !i + 1
  done;
  !lst

let read_list () =
  read_line ()
  |> String.trim
  |> String.split_on_char ' '
  |> List.map int_of_string
  |> List.map factors
  |> List.flatten
  |> List.sort compare

let rec g a b =
  let r = a mod b in
  if r = 0 then b else g b r

let rec gcd xs ys r =
  match (xs, ys) with
  | [], _ | _, [] -> r
  | x :: xs, y :: ys ->
      let z = g x y in
      if z <> 1 then gcd xs ys (r * z mod 1000000007)
      else if x < y then gcd xs (y :: ys) r
      else gcd (x :: xs) ys r

let () =
  let _ = read_line () in
  let xs = read_list () in
  let _ = read_line () in
  let ys = read_list () in
  print_int @@ gcd xs ys 1
