let divisors m =
  let lst = ref [] in
  for i = 1 to m do
    if m mod i = 0 then lst := i :: !lst
  done;
  !lst

let common_divisors m l =
  divisors m |> List.filter (fun x -> l mod x = 0) |> List.length

let () =
  let t = read_int () in
  for i = 1 to t do
    read_line () |> String.split_on_char ' ' |> List.map int_of_string
    |> function
    | [ m; l ] -> common_divisors m l |> Printf.printf "%d\n"
    | _ -> failwith "unreachable"
  done
