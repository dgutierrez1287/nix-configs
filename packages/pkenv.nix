{ stdenvNoCC, lib, pkgs, makeWrapper }:

let
  pname = "pkenv";
  version = "latest";
in
stdenvNoCC.mkDerivation {
  inherit pname version;

  src = pkgs.fetchFromGitHub {
    owner = "iamhsa";
    repo = "pkenv";
    rev = "1bfc7d8477159825abb434298db2cd69309e4c79";
    sha256 = "1sdrqv3qkn0l71fxg6m5l1rrkignpp0qgbv0sb7z4cifw6wfpkha";
  };

  dontConfigure = true;
  dontBuild = true;

  nativeBuildInputs = [ ];

  installPhase = ''
    mkdir -p $out/pkenv
    cp -r * $out/pkenv
  '';

  fixupPhase = ''
    --run 'export '

  # fixupPhase = ''
  #   wrapProgram $out/pkenv/bin/pkenv \
  #   --run 'export PKENV_CONFIG_DIR="''${PKENV_CONFIG_DIR:-$HOME/.local/pkenv}"' \
  #   --run 'mkdir -p $PKENV_CONFIG_DIR'
  #   wrapProgram $out/pkenv/bin/packer \
  #   --run 'export PKENV_CONFIG_DIR="''${PKENV_CONFIG_DIR:-$HOME/.local/pkenv}"' \
  #   --run 'mkdir -p $PKENV_CONFIG_DIR'
  # '';

  meta = with lib; {
    description = "Packer version manager";
    homepage = "https://github.com/iamhsa/pkenv";
    license = licenses.mit;
    platforms = platforms.unix;
  };

}
