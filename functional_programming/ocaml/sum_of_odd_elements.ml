let rec read_lines () =
  try
    let line = read_int () in
    line :: read_lines ()
  with End_of_file -> []

let () =
  let lst = read_lines () in
  List.filter (fun x -> x mod 2 <> 0) lst
  |> List.fold_left (fun acc x -> acc + x) 0
  |> print_int
