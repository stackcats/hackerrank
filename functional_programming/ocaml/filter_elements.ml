module IntMap = Map.Make (struct
  type t = int

  let compare = compare
end)

let filter lst k =
  let update = function None -> Some 1 | Some n -> Some (n + 1) in
  let mp =
    List.fold_left (fun acc x -> IntMap.update x update acc) IntMap.empty lst
  in
  List.fold_left
    (fun acc x ->
      if IntMap.find x mp >= k && not (List.mem x acc) then x :: acc else acc)
    [] lst
  |> List.rev

let print lst =
  let line =
    match lst with
    | [] -> "-1"
    | lst -> List.map string_of_int lst |> String.concat " "
  in
  print_endline line

let read_list () =
  let line = read_line () in
  String.split_on_char ' ' line |> List.map int_of_string

let () =
  let t = read_int () in
  List.init t (fun _ ->
      let [ _; k ] = read_list () in
      let lst = read_list () in
      filter lst k)
  |> List.iter print
