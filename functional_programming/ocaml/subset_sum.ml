let read_list () =
  read_line ()
  |> String.trim
  |> String.split_on_char ' '
  |> List.map int_of_string

let prepare lst =
  lst
  |> List.fast_sort (fun a b -> -1 * compare a b)
  |> List.fold_left
       (fun acc n -> if acc = [] then [ n ] else (n + List.hd acc) :: acc)
       []
  |> List.rev
  |> Array.of_list

let find s arr =
  let rec f i j =
    if i >= j then j
    else
      let m = i + ((j - i) / 2) in
      if s <= arr.(m) then f i m else f (m + 1) j
  in
  let last = Array.length arr - 1 in
  if s > arr.(last) then -1 else f 0 last |> ( + ) 1

let () =
  let _ = read_line () in
  let arr = read_list () |> prepare in
  let t = read_int () in
  for i = 1 to t do
    let s = read_int () in
    arr |> find s |> Printf.printf "%d\n"
  done
