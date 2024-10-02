let rec solve st max_area curr heights =
  if curr >= Array.length heights then max_area
  else if heights.(List.hd st) > heights.(curr) then
    let (h :: st') = st in
    let height = heights.(h) in
    let width = curr - List.hd st' - 1 in
    let area = height * width in
    solve st' (max max_area area) curr heights
  else solve (curr :: st) max_area (succ curr) heights

let read_list () =
  read_line () |> String.split_on_char ' ' |> List.map int_of_string

let () =
  let _ = read_line () and heights = read_list () in
  [ 0 ] @ heights @ [ 0 ] |> Array.of_list |> solve [ 0 ] 0 1 |> print_int
