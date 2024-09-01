open Base

let read_list () = Stdlib.read_line () |> String.split ~on:' '

let verify login_attempt passwords =
  let dp = ref @@ Map.empty (module String) in
  let rec dfs arr s =
    if String.is_empty s then Some arr
    else if Map.mem !dp s then Map.find_exn !dp s
    else
      let data =
        passwords
        |> List.filter ~f:(fun suffix -> String.is_suffix s ~suffix)
        |> List.fold_until ~init:arr ~finish:(Fn.const None) ~f:(fun acc p ->
               match dfs (p :: acc) (String.chop_suffix_exn ~suffix:p s) with
               | None -> Continue acc
               | res -> Stop res)
      in
      dp := Map.set !dp ~key:s ~data;
      data
  in
  match dfs [] login_attempt with
  | None -> "WRONG PASSWORD"
  | Some arr -> String.concat arr ~sep:" "

let () =
  let t = Stdlib.read_int () in
  for i = 1 to t do
    let _ = Stdlib.read_line ()
    and passwords = read_list ()
    and login_attempt = Stdlib.read_line () in
    Stdlib.print_endline @@ verify login_attempt passwords
  done
