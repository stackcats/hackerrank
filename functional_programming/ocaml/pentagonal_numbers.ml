let p n = ((3 * n * n) - n) / 2

let () =
  let t = read_int () in
  for i = 1 to t do
    let n = read_int () in
    Printf.printf "%d\n" @@ p n
  done
