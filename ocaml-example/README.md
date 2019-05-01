# OCaml support

Mayhem can be used to check compiled OCaml code.  Note that we do
*not* support AFL instrumentation at this time. We plan to add it in
the future (though note when added it will require OCaml 4.05 or
above).

Mayhem uses Unix signals to determine when a program has gone
wrong. This code base shows how to raise a UNIX signal on all
unhandled exceptions. The crux of the idea is to wrap `main` with an
exception handler that raises a segmentation fault. This should work
with any OCaml binary.

The magic is in `notify_mayhem` inside `readline.ml`. Note there is a
hacky way that does not require adding any libraries, and a better way
that requires you add linking in the Unix library.


Credit: from https://codegolf.stackexchange.com/questions/4399/shortest-code-that-raises-a-sigsegv
