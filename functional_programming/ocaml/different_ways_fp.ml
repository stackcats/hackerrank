module MyMap = Map.Make (struct
  type t = int * int

  let compare = compare
end)

let dp = ref MyMap.empty

let count n k =
  let rec count' n = function
    | 0 -> 1
    | k when k = n -> 1
    | k -> (
        match MyMap.find_opt (n, k) !dp with
        | Some ct -> ct
        | _ ->
            let ct = count' (n - 1) (k - 1) + count' (n - 1) k in
            let ct = ct mod 100000007 in
            dp := MyMap.add (n, k) ct !dp;
            ct)
  in
  count' n k

let () =
  let t = read_int () in
  for i = 1 to t do
    let [ n; k ] =
      read_line () |> String.split_on_char ' ' |> List.map int_of_string
    in
    Printf.printf "%d\n" @@ count n k
  done
