{
  lib,
  stdenv,
  fetchFromGitHub,
  python3,
  zip,
}: let
  rev = "c626e1317d96c5e6b4d0b2f8bf584370422a9128";
  version = builtins.substring 0 7 rev;
  sha256 = "sha256-8xhT9YBdhSxLDKxuZGXOo7Hya6DuWPi4kSoIloEkyjc=";

  pname = "queercat";
  src = fetchFromGitHub {
    owner = "Elsa002";
    repo = pname;
    rev = rev;
    inherit sha256;
  };
in
  stdenv.mkDerivation {
    inherit pname version src;
    buildPhase = ''
      runHook preBuild

      gcc main.c -lm -o queercat

      runHook postBuild
    '';
    installPhase = ''
      runHook preInstall

      mkdir -p $out/bin
      cp queercat $out/bin
      chmod +x $out/bin/queercat

      runHook postInstall
    '';
    meta = with lib; {
      description = "A version of lolcat with options for some LGBTQ+ flags";
      homepage = "https://github.com/SpyHoodle/pridefetch";
      license = licenses.unfree;
      maintainers = [
        maintainers.minion3665
      ];
      platforms = platforms.all;
    };
  }
