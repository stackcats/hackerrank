let rec f = function [] -> [] | a :: [] -> [] | _ :: a :: rest -> a :: f rest

let rec read_lines () =
  try
    let n = read_int () in
    n :: read_lines ()
  with End_of_file -> []

let print x =
  print_int x;
  print_newline ()

let () =
  let arr = read_lines () in
  arr |> f |> List.iter print
