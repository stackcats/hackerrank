let rec reduce = function
  | [], res -> List.rev res
  | x :: xs, res -> (
      match List.find_opt (Char.equal x) res with
      | None -> reduce (xs, x :: res)
      | _ -> reduce (xs, res))

let () =
  let lst = read_line () |> String.to_seq |> List.of_seq in
  reduce (lst, []) |> List.to_seq |> String.of_seq |> print_string
