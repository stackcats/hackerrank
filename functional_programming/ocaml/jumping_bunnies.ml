let rec gcd a b =
  let r = Int64.rem a b in
  if r = Int64.zero then b else gcd b r

let lcm a b =
  let g = gcd a b in
  Int64.mul (Int64.div a g) b

let () =
  let _ = read_line () in
  read_line ()
  |> String.split_on_char ' '
  |> List.map Int64.of_string
  |> List.fold_left lcm Int64.one
  |> Int64.to_string
  |> print_string
