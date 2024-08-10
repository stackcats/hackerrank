let compress ch = function
  | 0 -> ""
  | 1 -> Printf.sprintf "%c" ch
  | n -> Printf.sprintf "%c%d" ch n

let () =
  read_line () |> String.to_seq |> List.of_seq
  |> List.fold_left
       (fun (buf, prev, ct) c ->
         if prev = c then (buf, prev, ct + 1)
         else
           let s = compress prev ct in
           Buffer.add_string buf s;
           (buf, c, 1))
       (Buffer.create 1000, '.', 0)
  |> fun (buf, prev, ct) ->
  let s = compress prev ct in
  Buffer.add_string buf s;
  buf |> Buffer.contents |> print_string
