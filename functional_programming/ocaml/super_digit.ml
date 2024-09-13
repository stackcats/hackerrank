let rec super_digit k n =
  if String.length n = 1 then int_of_string n
  else
    n
    |> String.to_seq
    |> Seq.fold_left (fun acc c -> acc + ((int_of_char c - 48) * k)) 0
    |> string_of_int
    |> super_digit 1

let () =
  let n, k = Scanf.scanf "%s %d" (fun n k -> (n, k)) in
  print_int @@ super_digit k n
