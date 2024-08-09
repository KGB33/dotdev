{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    cargo2nix.url = "github:cargo2nix/cargo2nix/release-0.11.0";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-utils.follows = "flake-utils";
      };
    };
  };
  outputs = {
    self,
    nixpkgs,
    flake-utils,
    cargo2nix,
    rust-overlay,
  }:
    flake-utils.lib.eachDefaultSystem
    (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [cargo2nix.overlays.default (import rust-overlay)];
        };
        rustPkgs = pkgs.rustBuilder.makePackageSet {
          rustChannel = "nightly";
          packageFun = import ./Cargo.nix;
        };
        rustToolchain = pkgs.pkgsBuildHost.rust-bin.fromRustupToolchainFile ./rust-toolchain.toml;
      in rec
      {
        packages = {
          dotdev = rustPkgs.workspace.dotdev {};
          default = packages.dotdev;
        };
        devShells = {
          default = pkgs.mkShell {
            buildInputs = [rustToolchain];
          };
        };
      }
    );
}
