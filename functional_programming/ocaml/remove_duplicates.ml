module CharSet = Set.Make (struct
  type t = char

  let compare = compare
end)

let () =
  read_line ()
  |> String.to_seq
  |> List.of_seq
  |> List.fold_left
       (fun (mp, acc) c ->
         if CharSet.mem c mp then (mp, acc) else (CharSet.add c mp, c :: acc))
       (CharSet.empty, [])
  |> snd
  |> List.rev
  |> List.to_seq
  |> String.of_seq
  |> print_string
