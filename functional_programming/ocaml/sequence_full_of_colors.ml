let check s =
  try
    String.to_seq s
    |> Seq.fold_left
         (fun (r, g, y, b) c ->
           let r, g, y, b =
             match c with
             | 'R' -> (r + 1, g, y, b)
             | 'G' -> (r, g + 1, y, b)
             | 'Y' -> (r, g, y + 1, b)
             | _ -> (r, g, y, b + 1)
           in
           if abs (r - g) > 1 then failwith "error"
           else if abs (y - b) > 1 then failwith "error"
           else (r, g, y, b))
         (0, 0, 0, 0)
    |> fun (r, g, y, b) -> r = g && y = b
  with _ -> false

let () =
  let print = function
    | true -> print_endline "True"
    | false -> print_endline "False"
  in
  let t = read_int () in
  List.init t (fun _ -> read_line ()) |> List.map check |> List.iter print
