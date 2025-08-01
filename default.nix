{ pkgs ? import <nixpkgs> { } }: rec {
  # The `lib`, `modules`, and `overlays` names are special
  lib = import ./lib { inherit pkgs; }; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays

  auditok = pkgs.callPackage ./pkgs/auditok { };
  bip39 = pkgs.callPackage ./pkgs/bip39 { };
  bop = pkgs.callPackage ./pkgs/bop { };
  cursor = pkgs.callPackage ./pkgs/cursor { };
  ffsubsync = pkgs.callPackage ./pkgs/ffsubsync { inherit auditok pysubs2; };
  musescore = pkgs.callPackage ./pkgs/musescore { };
  my-bookmarks-pl = pkgs.callPackage ./pkgs/my-bookmarks-pl { };
  neocities-deploy = pkgs.callPackage ./pkgs/neocities-deploy { };
  pd-else = pkgs.callPackage ./pkgs/pd-else { };
  pysubs2 = pkgs.callPackage ./pkgs/pysubs2 { };
  subtitlecomposer = pkgs.callPackage ./pkgs/subtitlecomposer { };
}
