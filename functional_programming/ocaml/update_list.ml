let rec read_lines () =
  try
    let line = read_int () in
    line :: read_lines ()
  with End_of_file -> []

let print x =
  print_int x;
  print_newline ()

let () = read_lines () |> List.map abs |> List.iter print
