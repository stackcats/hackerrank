let poly coeffs exps x =
  List.fold_left2 (fun acc c e -> acc +. (c *. (x ** e))) 0. coeffs exps

let step = 0.001
let rec intervals l r = if l > r then [] else l :: intervals (l +. step) r

let area f l r =
  intervals l r |> List.fold_left (fun acc x -> acc +. f x) 0. |> ( *. ) step

let volume f l r =
  intervals l r
  |> List.fold_left (fun acc x -> acc +. (f x ** 2.)) 0.
  |> ( *. ) step |> ( *. ) Float.pi

let list_of_line line =
  line |> String.split_on_char ' ' |> List.map float_of_string

let () =
  let coeffs = read_line () |> list_of_line
  and exps = read_line () |> list_of_line
  and [ l; r ] = read_line () |> list_of_line in
  let f = poly coeffs exps in
  let a = area f l r and v = volume f l r in
  Printf.printf "%.2f\n%.2f\n" a v
