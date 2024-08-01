let () =
  let rec fib a b n = if n = 0 then a else fib b (a + b) (n - 1) in
  let n = read_int () in
  n - 1 |> fib 0 1 |> print_int
