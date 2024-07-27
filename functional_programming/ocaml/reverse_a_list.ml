let reverse lst =
  let rec do_reverse = function
    | [], ys -> ys
    | x :: xs, ys -> do_reverse (xs, x :: ys)
  in
  do_reverse (lst, [])

let rec read_lines () =
  try
    let n = read_int () in
    n :: read_lines ()
  with End_of_file -> []

let print n =
  print_int n;
  print_newline ()

let () =
  let lst = read_lines () in
  reverse lst |> List.iter print
