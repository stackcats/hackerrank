open Base

let read_point () =
  Stdlib.read_line () |> String.split ~on:' ' |> List.map ~f:Float.of_string
  |> fun [ x; y ] -> (x, y)

let distance (x1, y1) (x2, y2) =
  let dx = x1 -. x2 and dy = y1 -. y2 in
  Float.sqrt ((dx *. dx) +. (dy *. dy))

let polar_angle (x1, y1) (x2, y2) =
  let dx = x1 -. x2 and dy = y1 -. y2 in
  Float.atan2 dy dx

let ccw (x1, y1) (x2, y2) (x3, y3) =
  ((x2 -. x1) *. (y3 -. y1)) -. ((y2 -. y1) *. (x3 -. x1))

let perimeter points =
  let p0 = List.hd_exn points in
  let rec f acc = function
    | [ p1 ] -> acc +. distance p1 p0
    | p1 :: (p2 :: _ as ps) -> f (acc +. distance p1 p2) ps
  in
  f 0. points

let graham_scan points =
  let rec scan = function
    | st, [] -> st
    | [], p :: ps -> scan ([ p ], ps)
    | ([ _ ] as st), p :: ps -> scan (p :: st, ps)
    | p2 :: (p1 :: _ as st), (p3 :: _ as ps) when Float.(ccw p1 p2 p3 <= 0.) ->
        scan (st, ps)
    | st, p :: ps -> scan (p :: st, ps)
  in
  scan ([], points)

let () =
  let n = Stdlib.read_int () in
  let points = List.init n ~f:(fun _ -> read_point ()) in
  let (Some p0) =
    List.min_elt points ~compare:(fun a b -> Float.compare (snd a) (snd b))
  in
  let compare p1 p2 =
    let a1 = polar_angle p0 p1 and a2 = polar_angle p0 p2 in
    match Float.compare a1 a2 with
    | 0 -> Float.compare (distance p0 p1) (distance p0 p2)
    | n -> n
  in
  points
  |> List.sort ~compare
  |> graham_scan
  |> perimeter
  |> Stdlib.Printf.printf "%.1f"
