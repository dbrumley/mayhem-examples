# OCaml support
Mayhem uses Unix signals to determine when an error has occurred.

You can get Mayhem to check for an error by raising a UNIX
signal. This is pretty hacky, but is an example of how you could get
Mayhem (and fuzzing) to work for you.

The magic is in `raise_signal.ml` inside `readline.ml`.
