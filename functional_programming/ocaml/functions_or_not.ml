let rec read_lines n =
  List.init n (fun _ -> 0)
  |> List.map (fun _ ->
         let line = read_line () |> String.trim in
         Scanf.sscanf line "%d %d" (fun a b -> (a, b)))

let is_function lst =
  if
    List.for_all
      (fun (d, r) ->
        List.find_all (fun (x, y) -> x = d) lst
        |> List.for_all (fun (_, y) -> y = r))
      lst
  then "YES"
  else "NO"

let read () = read_line () |> String.trim |> int_of_string

let () =
  let t = read () in
  List.init t (fun _ -> 0)
  |> List.iter (fun _ -> read () |> read_lines |> is_function |> print_endline)
