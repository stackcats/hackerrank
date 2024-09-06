type tree = Leaf | Node of (int * tree * tree)

let new_node = function -1 -> Leaf | v -> Node (v, Leaf, Leaf)

let insert k a b =
  let rec insert' = function
    | Leaf -> Leaf
    | Node (v, l, r) when k = v -> Node (v, new_node a, new_node b)
    | Node (v, l, r) -> Node (v, insert' l, insert' r)
  in
  insert'

let rec inorder = function
  | Leaf -> []
  | Node (v, l, r) -> inorder l @ [ v ] @ inorder r

let print_tree tree =
  tree |> inorder |> List.iter (fun n -> Printf.printf "%d " n);
  print_string "\n"

let swap tree k =
  let rec swap' depth = function
    | Leaf -> Leaf
    | Node (v, l, r) ->
        let nd = depth + 1 in
        if depth mod k = 0 then Node (v, swap' nd r, swap' nd l)
        else Node (v, swap' nd l, swap' nd r)
  in
  swap' 1 tree

let read_list () =
  read_line () |> String.split_on_char ' ' |> List.map int_of_string

let () =
  let n = read_int () in
  let tree = ref @@ new_node 1 in
  for i = 1 to n do
    match read_list () with
    | [ a; b ] -> tree := insert i a b !tree
    | _ -> failwith "unreachable"
  done;
  let t = read_int () in
  for i = 1 to t do
    let k = read_int () in
    tree := swap !tree k;
    print_tree !tree
  done
