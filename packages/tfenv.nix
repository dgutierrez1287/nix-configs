{ stdenvNoCC, lib, pkgs, makeWrapper }:

let
  pname = "tfenv";
  version = "latest";
in
stdenvNoCC.mkDerivation {
  inherit pname version;

  src = pkgs.fetchFromGitHub {
    owner = "tfutils";
    repo = "tfenv";
    rev = "7e89520f4bdbacb5861aca209f0b8f89271287e1";
    sha256 = "qqO+vP7DieCxF5ezNN3rN0ktVj8Ikkmo0xbYdTAjCqc=";
  };

  dontConfigure = true;
  dontBuild = true;

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/usr/tfenv

    cp -r * $out/usr/tfenv
    ln -s $out/usr/tfenv/bin/tfenv $out/bin/tfenv
    ln -s $out/usr/tfenv/bin/terraform $out/bin/terraform
  '';

  # TFENV_CONFIG_DIR is only set if not already specified.
  # Using '--run export ...' instead of the builtin --set-default, since
  # expanding $HOME fails with --set-default.
  fixupPhase = ''
    wrapProgram $out/bin/tfenv \
    --run 'export TFENV_CONFIG_DIR="''${TFENV_CONFIG_DIR:-$HOME/.local/tfenv}"' \
    --run 'mkdir -p $TFENV_CONFIG_DIR'
    wrapProgram $out/bin/terraform \
    --run 'export TFENV_CONFIG_DIR="''${TFENV_CONFIG_DIR:-$HOME/.local/tfenv}"' \
    --run 'mkdir -p $TFENV_CONFIG_DIR'
  '';

  meta = with lib; {
    description = "Terraform version manager";
    homepage = "https://github.com/tfutils/tfenv";
    license = licenses.mit;
    platforms = platforms.unix;
  };
}
