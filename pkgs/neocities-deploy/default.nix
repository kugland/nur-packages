{ pkgs
, lib
, fetchFromGitHub
, fenix
,
}:
let
  toolchain = fenix.minimal.toolchain;
  buildRustPackage =
    (pkgs.makeRustPlatform {
      cargo = toolchain;
      rustc = toolchain;
    }).buildRustPackage;
in
buildRustPackage rec {
  pname = "neocities-deploy";
  version = "0.1.14";
  src = fetchFromGitHub {
    owner = "kugland";
    repo = "neocities-deploy";
    rev = "v${version}";
    hash = "sha256-sbVoFHEChwxeiIBf8rSnT5zOUEqblUTUWfFQ5SjEJv0=";
  };
  cargoHash = "sha256-Boy48me+SzHWB+nMWFkhlRfonHs7+xAZ/Z7hBEL0lyI=";
  doCheck = false;
  meta = with lib; {
    description = "A command-line tool for deploying your Neocities site";
    homepage = "https://github.com/kugland/neocities-deploy";
    license = licenses.gpl3;
    maintainers = [ lib.maintainers.kugland ];
  };
}
