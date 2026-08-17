let
  nixpkgs = builtins.getFlake "git+https://github.com/nixos/nixpkgs?ref=nixos-unstable&shallow=1";
  pkgs = import nixpkgs { system = builtins.currentSystem; };
in
# pkgs.callPackage ./pkg {}
pkgs.callPackage (
{
  lib,
  stdenv,
  cmake,
  ninja,
  pkg-config,
  mpv-unwrapped,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "poc";
  version = "0.0.1";

  src = ./poc;

  preConfigure =
  ''
    echo "$PKG_CONFIG_PATH"
    pkg-config --list-all | grep -i -e mpv
  '';

  nativeBuildInputs = [
    cmake
    pkg-config
    ninja
  ];

  buildInputs = [
    mpv-unwrapped.dev
  ];

  installPhase =
  ''
    echo true > $out
  '';
})
) {}
