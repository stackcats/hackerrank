let area points =
  let p = List.hd points in
  let dot (x1, y1) (x2, y2) = (x1 *. y2) -. (y1 *. x2) in
  let rec do_area = function
    | [] -> 0.
    | p2 :: [] -> dot p2 p
    | p1 :: p2 :: tl -> dot p1 p2 +. do_area (p2 :: tl)
  in
  let sum = do_area points |> Float.abs in
  sum /. 2.

let () =
  let n = read_int () in
  List.init n (fun _ -> 0)
  |> List.map (fun _ -> Scanf.scanf "%f %f\n" (fun x y -> (x, y)))
  |> area |> Printf.printf "%.1f"
