let
  nixpkgs = builtins.getFlake "git+https://github.com/nixos/nixpkgs?ref=nixos-unstable&shallow=1";
  pkgs = import nixpkgs { system = builtins.currentSystem; };
in
pkgs.callPackage ./pkg {}
