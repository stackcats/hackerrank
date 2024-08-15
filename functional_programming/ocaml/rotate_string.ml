let rotate = function [] -> failwith "unreachable" | h :: t -> t @ [ h ]
let to_string lst = List.to_seq lst |> String.of_seq

let rotate_all s =
  let lst = String.to_seq s |> List.of_seq in
  let ans = ref [] and curr = ref (rotate lst) in
  for i = 1 to List.length lst do
    ans := to_string !curr :: !ans;
    curr := rotate !curr
  done;
  List.rev !ans

let () =
  let t = read_int () in
  for i = 1 to t do
    read_line () |> rotate_all |> String.concat " " |> print_endline
  done
