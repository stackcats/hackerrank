module IntMap = Map.Make (struct
  type t = int

  let compare = compare
end)

let read_list () =
  read_line () |> String.split_on_char ' ' |> List.map int_of_string

let to_map =
  let update = function None -> Some 1 | Some n -> Some (n + 1) in
  List.fold_left (fun acc x -> IntMap.update x update acc) IntMap.empty

let () =
  let _ = read_int () in
  let xs = read_list () |> to_map in
  let _ = read_int () in
  let ys = read_list () |> to_map in
  let cmp k v =
    match IntMap.find_opt k ys with Some u when u > v -> true | _ -> false
  in
  let zs = IntMap.filter cmp xs in
  IntMap.fold (fun k _ acc -> k :: acc) zs []
  |> List.sort compare
  |> List.map string_of_int
  |> String.concat " "
  |> print_string
