let perimeter lst =
  let length (x1, y1) (x2, y2) =
    let x = x1 -. x2 and y = y1 -. y2 in
    Float.sqrt ((x *. x) +. (y *. y))
  in
  let p0 = List.hd lst in
  let rec do_perimeter = function
    | [] -> 0.
    | p :: [] -> length p p0
    | p1 :: p2 :: ps -> length p1 p2 +. do_perimeter (p2 :: ps)
  in
  do_perimeter lst

let () =
  let n = read_int () in
  List.init n (fun _ -> Scanf.scanf "%f %f\n" (fun a b -> (a, b)))
  |> perimeter |> Printf.printf "%.1f\n"
