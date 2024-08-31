let read_list () =
  read_line () |> String.split_on_char ' ' |> List.map int_of_string

let partition p lst =
  let rec f lft = function
    | [] -> (lft, [])
    | x :: xs when x < p -> f (lft @ [ x ]) xs
    | rht -> (lft, rht)
  in
  f [] lst

let rec is_bst = function
  | [] -> true
  | h :: t ->
      let lft, rht = partition h t in
      if List.exists (( < ) h) lft then false
      else if List.exists (( > ) h) rht then false
      else is_bst lft && is_bst rht

let () =
  let t = read_int () in
  for i = 1 to t do
    let _ = read_line () in
    let lst = read_list () in
    let r = is_bst lst in
    print_endline (if r then "YES" else "NO")
  done
