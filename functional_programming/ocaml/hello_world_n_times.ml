let () =
  let n = read_int () in
  List.init n (fun _ -> 0) |> List.iter (fun _ -> print_endline "Hello World")
