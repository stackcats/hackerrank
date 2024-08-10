let swap s =
  let rec swap' xs = function
    | [] -> xs
    | [ _ ] -> failwith "unreachable"
    | a :: b :: tl -> swap' (a :: b :: xs) tl
  in
  String.to_seq s |> List.of_seq |> swap' [] |> List.rev |> List.to_seq
  |> String.of_seq

let () =
  let t = read_int () in
  List.init t (fun _ -> read_line ())
  |> List.map swap |> List.iter print_endline
