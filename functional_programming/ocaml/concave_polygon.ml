open Base

let read_point () =
  Stdlib.read_line ()
  |> Stdlib.String.trim
  |> String.split ~on:' '
  |> List.map ~f:Float.of_string
  |> fun [ x; y ] -> (x, y)

let distance (x1, y1) (x2, y2) =
  let dy = y1 -. y2 and dx = x1 -. x2 in
  Float.sqrt ((dx *. dx) +. (dy *. dy))

let polar_angle (x1, y1) (x2, y2) =
  if Float.equal x1 x2 then -.Float.pi else Float.atan2 (y1 -. y2) (x1 -. x2)

let ccw (x1, y1) (x2, y2) (x3, y3) =
  ((x2 -. x1) *. (y3 -. y1)) -. ((y2 -. y1) *. (x3 -. x1))

let graham_scan points =
  let rec scan = function
    | st, [] -> "NO"
    | p2 :: p1 :: _, p3 :: _ when Float.(ccw p1 p2 p3 < 0.) -> "YES"
    | st, p :: ps -> scan (p :: st, ps)
  in
  scan ([], points)

let () =
  let n = Stdlib.read_line () |> Stdlib.String.trim |> int_of_string in
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
  points |> List.sort ~compare |> graham_scan |> print_string
