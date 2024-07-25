let rec read_lines () =
  try
    let n = read_int () in
    n :: read_lines ()
  with End_of_file -> []

let f n = List.filter (fun x -> x < n)

let () =
  let (n :: arr) = read_lines () in
  let ans = f n arr in
  List.iter
    (fun x ->
      print_int x;
      print_newline ())
    ans
