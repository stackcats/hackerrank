let read_lst () =
  read_line () |> String.split_on_char ' ' |> List.map int_of_string

let print_list l = List.iter print_int l

let rec reduce l1 l2 =
  match (l1, l2) with
  | [], _ | _, [] -> []
  | [ _ ], _ | _, [ _ ] -> failwith "unreachable"
  | p1 :: n1 :: l1', p2 :: n2 :: l2' ->
      if p1 < p2 then reduce l1' l2
      else if p1 > p2 then reduce l1 l2'
      else p1 :: min n1 n2 :: reduce l1' l2'

let () =
  let q = read_int () in
  match List.init q (fun _ -> read_lst ()) with
  | [] -> failwith "unreachable"
  | h :: t ->
      List.fold_left reduce h t
      |> List.map string_of_int
      |> String.concat " "
      |> print_string
