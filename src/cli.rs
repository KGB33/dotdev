use clap::{Parser, Subcommand};

pub fn run() {
    let cli = Cli::parse();

    match cli.cmd {
        Commands::Run => todo!(),
        Commands::Build => todo!(),
        Commands::New => todo!(),
    }
}

#[derive(Parser)]
struct Cli {
    #[command(subcommand)]
    cmd: Commands,
}

#[derive(Subcommand)]
enum Commands {
    Run,
    Build,
    New,
}
