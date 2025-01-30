{ pkgs ? import <nixpkgs> { }
, flakeLock ? pkgs.lib.importJSON ./flake.lock
, fenix ? import
    (pkgs.fetchFromGitHub (with flakeLock.nodes.fenix.locked; {
      inherit owner repo rev;
      hash = narHash;
    }))
    { }
,
}: rec {
  # The `lib`, `modules`, and `overlays` names are special
  lib = import ./lib { inherit pkgs; }; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays

  auditok = pkgs.callPackage ./pkgs/auditok { };
  bip39 = pkgs.callPackage ./pkgs/bip39 { };
  ffsubsync = pkgs.callPackage ./pkgs/ffsubsync { inherit auditok pysubs2; };
  my-bookmarks-pl = pkgs.callPackage ./pkgs/my-bookmarks-pl { };
  neocities-deploy = pkgs.callPackage ./pkgs/neocities-deploy { inherit fenix; };
  pysubs2 = pkgs.callPackage ./pkgs/pysubs2 { };
  subtitlecomposer = pkgs.callPackage ./pkgs/subtitlecomposer { };
}
