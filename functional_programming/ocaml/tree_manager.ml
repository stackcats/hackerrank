open Base

type 'a zipper = {
  focus : 'a;
  children : 'a zipper list;
  parent : (int * 'a zipper) option;
}

let new_node x = { focus = x; children = []; parent = None }

let update_nth v n lst =
  let lft, rht = List.split_n lst n in
  lft @ (v :: List.tl_exn rht)

let insert_nth x n lst =
  let lft, rht = List.split_n lst n in
  lft @ (new_node x :: rht)

let delete_nth n lst =
  let lft, rht = List.split_n lst n in
  lft @ List.tl_exn rht

let change x z = { z with focus = x }

let print z =
  Stdlib.Printf.printf "%d\n" z.focus;
  z

let visit_left z =
  let n, parent = Option.value_exn z.parent in
  let parent = { parent with children = update_nth z n parent.children } in
  let child = List.nth_exn parent.children (n - 1) in
  { child with parent = Some (n - 1, parent) }

let visit_right z =
  let n, parent = Option.value_exn z.parent in
  let parent = { parent with children = update_nth z n parent.children } in
  let child = List.nth_exn parent.children (n + 1) in
  { child with parent = Some (n + 1, parent) }

let visit_parent z =
  let n, parent = Option.value_exn z.parent in
  { parent with children = update_nth z n parent.children }

let visit_child n z =
  let child = List.nth_exn z.children n in
  { child with parent = Some (n, z) }

let insert_left x z =
  let n, parent = Option.value_exn z.parent in
  let children = parent.children |> update_nth z n |> insert_nth x n in
  let parent = { parent with children } in
  { z with parent = Some (n + 1, parent) }

let insert_right x z =
  let n, parent = Option.value_exn z.parent in
  let children = parent.children |> update_nth z n |> insert_nth x (n + 1) in
  let parent = { parent with children } in
  { z with parent = Some (n, parent) }

let insert_child x z =
  let node = new_node x in
  { z with children = node :: z.children }

let delete z =
  let n, parent = Option.value_exn z.parent in
  { parent with children = delete_nth n parent.children }

type command =
  | Change of int
  | Print
  | Left
  | Right
  | Parent
  | Child of int
  | InsertLeft of int
  | InsertRight of int
  | InsertChild of int
  | Delete

let parse_command s =
  let lst = String.split ~on:' ' s in
  match lst with
  | [ "change"; x ] -> Change (Int.of_string x)
  | [ "print" ] -> Print
  | [ "visit"; "left" ] -> Left
  | [ "visit"; "right" ] -> Right
  | [ "visit"; "parent" ] -> Parent
  | [ "visit"; "child"; n ] -> Child (Int.of_string n - 1)
  | [ "insert"; "left"; x ] -> InsertLeft (Int.of_string x)
  | [ "insert"; "right"; x ] -> InsertRight (Int.of_string x)
  | [ "insert"; "child"; x ] -> InsertChild (Int.of_string x)
  | [ "delete" ] -> Delete
  | _ -> failwith @@ "unsupported command: " ^ s

let () =
  let z = ref @@ new_node 0 and q = Stdlib.read_int () in
  for i = 1 to q do
    match parse_command @@ Stdlib.read_line () with
    | Change x -> z := change x !z
    | Print -> z := print !z
    | Left -> z := visit_left !z
    | Right -> z := visit_right !z
    | Parent -> z := visit_parent !z
    | Child n -> z := visit_child n !z
    | InsertLeft x -> z := insert_left x !z
    | InsertRight x -> z := insert_right x !z
    | InsertChild x -> z := insert_child x !z
    | Delete -> z := delete !z
  done
