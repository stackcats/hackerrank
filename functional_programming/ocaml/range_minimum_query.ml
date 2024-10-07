let read_list () =
  read_line () |> String.split_on_char ' ' |> List.map int_of_string

let left node = (node * 2) + 1
let right node = (node * 2) + 2

let build lst =
  let arr = Array.of_list lst in
  let len = Array.length arr * 3 in
  let tree = Array.make len max_int in
  let rec build' node start end_ =
    if start = end_ then tree.(node) <- arr.(start)
    else
      let mid = (start + end_) / 2
      and left_node = left node
      and right_node = right node in
      build' left_node start mid;
      build' right_node (succ mid) end_;
      tree.(node) <- min tree.(left_node) tree.(right_node)
  in
  build' 0 0 (pred @@ Array.length arr);
  tree

let query tree n l r =
  let rec query' node start end_ =
    if r < start || l > end_ then max_int
    else if l <= start && end_ <= r then tree.(node)
    else
      let mid = (start + end_) / 2
      and left_node = left node
      and right_node = right node in
      min (query' left_node start mid) (query' right_node (succ mid) end_)
  in

  query' 0 0 (pred n)

let () =
  let [ n; m ] = read_list () in
  let lst = read_list () in
  let seg_tree = build lst in
  for _ = 1 to m do
    let [ l; r ] = read_list () in
    query seg_tree n l r |> Printf.printf "%d\n"
  done
