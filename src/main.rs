// src/main.rs
use std::{env, io::{self, Read}};

fn main() {
    // Get the line either from args (joined with spaces) or stdin
    let mut line = if env::args().len() > 1 {
        env::args().skip(1).collect::<Vec<_>>().join(" ")
    } else {
        let mut s = String::new();
        io::stdin().read_to_string(&mut s).unwrap();
        s
    };

    // Optional: allow using "doas", custom prefixes, etc.
    let prefix = env::var("SUDOBANG_PREFIX").unwrap_or_else(|_| "sudo ".to_string());

    // Work on the raw line, but only trigger if the last non-newline char is '!'
    while line.ends_with('\n') || line.ends_with('\r') {
        line.pop();
    }
    let trimmed_right = line.trim_end();
    if trimmed_right.ends_with('!') {
        let without_bang = trimmed_right.trim_end_matches('!');
        // Preserve any left-side spacing; drop right-side spacing+bang
        println!("{}{}", prefix, without_bang);
    } else {
        // Pass-through unchanged so the widget can be reused safely
        print!("{}", line);
    }
}

