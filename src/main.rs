use std::fs;
use std::{env, process::exit};

fn die(msg: String) -> ! {
    eprintln!("{}", msg);
    exit(1);
}

fn main() {
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
        unsafe { *(0 as *mut _) = 3 };
    } else {
        println!("Good execution!");
    }
}

