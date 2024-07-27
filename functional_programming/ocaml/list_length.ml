let rec read_lines () =
  try
    let line = read_int () in
    line :: read_lines ()
  with End_of_file -> []

let rec length = function [] -> 0 | _ :: xs -> 1 + length xs
let () = read_lines () |> length |> print_int
