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
  

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/usr/pkenv

    cp -r * $out/usr/pkenv
    ln -s $out/usr/pkenv/bin/pkenv $out/bin/pkenv
    ln -s $out/usr/pkenv/bin/packer $out/bin/packer
  '';

  fixupPhase = ''
    wrapProgram $out/bin/pkenv \
    --run 'export PKENV_CONFIG_DIR="''${PKENV_CONFIG_DIR:-$HOME/.local/pkenv}"' \
    --run 'mkdir -p $PKENV_CONFIG_DIR'
    wrapProgram $out/bin/packer \
    --run 'export PKENV_CONFIG_DIR="''${PKENV_CONFIG_DIR:-$HOME/.local/pkenv}"' \
    --run 'mkdir -p $PKENV_CONFIG_DIR'
  '';
  
  # postInstall = ''
  #   export HOME=$(pwd)
  #   mkdir -p $out/bin
  #   ln -fs $out/pkenv/bin/pkenv $out/bin/pkenv
  #   ln -fs $out/pkenv/bin/packer $out/bin/packer
  #   export PKENV_CONFIG_DIR="''${TFENV_CONFIG_DIR:-$HOME/.local/pkenv}"
  #   mkdir -p $PKENV_CONFIG_DIR
  # '';

  meta = with lib; {
    description = "Packer version manager";
    homepage = "https://github.com/iamhsa/pkenv";
    license = licenses.mit;
    platforms = platforms.unix;
  };

}
