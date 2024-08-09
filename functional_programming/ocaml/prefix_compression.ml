let to_list s = String.to_seq s |> List.of_seq
let to_string lst = List.to_seq lst |> String.of_seq

let compress x y =
  let xs = to_list x and ys = to_list y in
  let rec compress' p xs ys =
    if xs = [] || ys = [] then (p, xs, ys)
    else if List.hd xs = List.hd ys then
      compress' (List.hd xs :: p) (List.tl xs) (List.tl ys)
    else (p, xs, ys)
  in
  let p, x, y = compress' [] xs ys in
  List.map to_string [ List.rev p; x; y ]

let output s = Printf.printf "%d %s\n" (String.length s) s

let () =
  let x = read_line () and y = read_line () in
  List.iter output (compress x y)
