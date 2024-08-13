let fib n =
  let rec fib' a b = function
    | 0 -> a
    | n -> fib' b ((a + b) mod 100000007) (n - 1)
  in
  fib' 0 1 n

let () =
  let t = read_int () in
  List.init t (fun _ -> read_int ())
  |> List.map fib
  |> List.iter (Printf.printf "%d\n")
