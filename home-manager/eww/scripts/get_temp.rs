use std::process::{Command, Stdio};

fn main() {
    let acpi_out = String::from_utf8_lossy(Command::new("acpi")
        .arg("-tf")
        .stdout()
        .expect("Needed that output"));
    let awk_it = Command::new("awk")
        .arg("-F")
        .arg(" ")
        .arg("{print $4}")
        .stdin(Stdio::piped())
        .spawn().unwrap();
    write!()

}
