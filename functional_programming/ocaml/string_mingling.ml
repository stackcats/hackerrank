let () =
  let read () = read_line () |> String.to_seq |> List.of_seq in
  let lp = read () and lq = read () in
  List.fold_right2 (fun p q acc -> p :: q :: acc) lp lq []
  |> List.to_seq |> String.of_seq |> print_string
