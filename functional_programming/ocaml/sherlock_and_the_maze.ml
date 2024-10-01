let mod_val = 1000000007

let dp =
  Array.init 101 (fun _ ->
      Array.init 101 (fun _ -> Array.init 101 (fun _ -> Array.make 2 0)))

let solve () =
  let n = 100 and m = 100 and k = 100 in
  for i = 1 to n do
    for kk = 0 to k do
      dp.(i).(1).(kk).(0) <- 1;
      dp.(1).(i).(kk).(1) <- 1
    done
  done;

  for i = 2 to n do
    for j = 2 to m do
      for kk = 0 to k do
        dp.(i).(j).(kk).(0) <- dp.(i - 1).(j).(kk).(0);
        dp.(i).(j).(kk).(1) <- dp.(i).(j - 1).(kk).(1);
        if kk > 0 then (
          dp.(i).(j).(kk).(0) <-
            (dp.(i).(j).(kk).(0) + dp.(i - 1).(j).(kk - 1).(1)) mod mod_val;
          dp.(i).(j).(kk).(1) <-
            (dp.(i).(j).(kk).(1) + dp.(i).(j - 1).(kk - 1).(0)) mod mod_val)
      done
    done
  done

let () =
  solve ();
  let t = read_int () in
  for _ = 1 to t do
    let input = read_line () in
    let [ n; m; k ] = List.map int_of_string (String.split_on_char ' ' input) in
    let ans =
      if n = 1 && m = 1 then 1 else dp.(n).(m).(k).(0) + dp.(n).(m).(k).(1)
    in
    Printf.printf "%d\n" @@ (ans mod mod_val)
  done
