{ pkgs
, lib
, fetchFromGitHub
, rustPlatform
, buildRustPackage ? rustPlatform.buildRustPackage
,
}:
buildRustPackage rec {
  pname = "neocities-deploy";
  version = "0.1.13";
  src = fetchFromGitHub {
    owner = "kugland";
    repo = "neocities-deploy";
    rev = "v${version}";
    hash = "sha256-Xy+YfXSb2ffIu4Ost5tKDXXAOzR+kkfR5kwqdlVLo0o=";
  };
  cargoHash = "sha256-G119UJ7b9nK4XiPtKSKcRPncpWBKRw9GRnJ1PjTAA2Q=";
  meta = with lib; {
    description = "A command-line tool for deploying your Neocities site";
    homepage = "https://github.com/kugland/neocities-deploy";
    license = licenses.gpl3;
    maintainers = [ ];
  };
}
