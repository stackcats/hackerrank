let next lst =
  let rec do_next lst =
    if List.length lst < 2 then [ 1 ]
    else
      let (a :: b :: tl) = lst in
      (a + b) :: do_next (b :: tl)
  in
  1 :: do_next lst

let rec pascals = function
  | 0 -> []
  | 1 -> [ [ 1 ] ]
  | n ->
      let (hd :: tl) = pascals (n - 1) in
      next hd :: hd :: tl

let print_list lst =
  List.map string_of_int lst |> String.concat " " |> print_endline

let () =
  let n = read_int () in
  pascals n |> List.rev |> List.iter print_list
