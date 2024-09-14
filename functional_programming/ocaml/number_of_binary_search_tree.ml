module IntMap = Map.Make (struct
  type t = int

  let compare = compare
end)

let dp = ref IntMap.empty

let rec aux = function
  | 0 | 1 -> 1
  | n -> (
      match IntMap.find_opt n !dp with
      | Some m -> m
      | _ ->
          let m = ref 0 in
          for i = 0 to n - 1 do
            m := (!m + (aux i * aux (n - i - 1))) mod 100000007
          done;
          dp := IntMap.add n !m !dp;
          !m)

let () =
  let t = read_int () in
  for i = 1 to t do
    let n = read_int () in
    Printf.printf "%d\n" @@ aux n
  done
