let rec count i x n =
  let m = i ** n in
  match compare m x with
  | 0 -> 1
  | 1 -> 0
  | _ -> count (i +. 1.) (x -. m) n + count (i +. 1.) x n

let () =
  let x = read_float () in
  let n = read_float () in
  count 1. x n |> print_int
