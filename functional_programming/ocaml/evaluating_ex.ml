let e x =
  let f (ans, curr) i =
    let curr = curr *. x /. float i in
    (ans +. curr, curr)
  in
  List.init 9 (fun i -> i + 1) |> List.fold_left f (1., 1.) |> fst

let () =
  let n = read_int () in
  List.init n (fun _ -> read_float ())
  |> List.map e
  |> List.iter (Printf.printf "%.4f\n")
