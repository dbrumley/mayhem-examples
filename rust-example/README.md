# Rust support

Mayhem can be used to check compiled Rust code.

Mayhem uses Unix signals to determine when a program has gone wrong.
This code base shows how to raise such a signal when Rust would panic.
Here, I use a nightly feature to run an `abort()` before the default panic handler gets to run.

This approach doesn't require adding any new external crates but does require recompilation with the nightly toolchain.

