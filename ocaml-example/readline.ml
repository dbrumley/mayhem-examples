let notify_mayhem () = Obj.magic 0 0

let _ =
  let ic = open_in Sys.argv.(1) in
  let s = input_line ic in
  match Array.to_list (Array.init (String.length s) (String.get s)) with
    ['s'; 'e'; 'c'; 'r'; 'e'; 't'; ' '; 'c'; 'o'; 'd'; 'e'] -> notify_mayhem ()
  | ['r'; 'e'; 'c'; 'r'; 'e'; 't'; ' '; 'c'; 'o'; 'd'; 'e'] -> notify_mayhem ()
  | _ -> ()
