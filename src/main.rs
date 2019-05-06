#![feature(core_intrinsics)]

use core::intrinsics;
use std::{env, fs, panic, process::exit};

fn set_panic_abort() {
    panic::set_hook(Box::new(|_| {
        unsafe { intrinsics::abort() };
    }));
}

fn die(msg: String) -> ! {
    eprintln!("{}", msg);
    exit(1);
}

fn main() {
    set_panic_abort();

    let args: Vec<String> = env::args().collect();

    if args.len() < 2 {
        die(format!("Usage: {} FILE", args[0]));
    }
    let filename = &args[1];

    let read = fs::read_to_string(&filename);
    if read.is_err() {
        die(format!("Error reading file: {}", filename));
    }

    let contents = read.unwrap();
    if contents.trim() == "secret code" || contents.trim().len() == 3 {
        println!("Uh-oh!");
        panic!();
    } else {
        println!("Good execution!");
    }
}
