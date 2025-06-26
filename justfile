# Format the Nix code in the repository.
format:
    just --unstable --fmt
    nix shell nixpkgs#nixpkgs-fmt -c nixpkgs-fmt .
