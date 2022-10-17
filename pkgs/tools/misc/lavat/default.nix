{
  lib,
  stdenv,
  fetchFromGitHub,
}: let
  rev = "5d2629cafe6ee4e7cff2da7c9989e266cf633334";
  sha256 = "sha256-Hm8rVSYtK9eIFG9919gHrJ0KHg0xpZVIcQsEkmveMF0=";
in stdenv.mkDerivation {
  pname = "lavat";
  version = builtins.substring 0 7 rev;

  src = fetchFromGitHub {
    owner = "AngelJumbo";
    repo = "lavat";
    inherit rev sha256;
  };

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    cp lavat $out/bin
    runHook postInstall
  '';

  meta = with lib; {
    description = "Lava lamp simulation in the terminal";
    longDescription = ''
      Lavat puts ascii metaballs in your terminal to make it look a bit like a
      lava lamp.

      Lavat contains various options, including those to change the color and
      speed of the metaballs. For a full list, run `lavat -h`
    '';
    maintainers = [maintainers.minion3665];
    license = licenses.mit;
    homepage = "https://github.com/AngelJumbo/lavat";
    platforms = platforms.all;
  };
}
