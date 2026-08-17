let
  nixpkgs = builtins.getFlake "github:nixos/nixpkgs/nixos-unstable";
  pkgs = import nixpkgs { system = builtins.currentSystem; };
in
pkgs.runCommand "test" {
  nativeBuildInputs = with pkgs; [ pkg-config ];
  buildInputs = with pkgs; [ mpv ];
}
''
  echo \#; pkg-config --list-all; echo \#; # exit 1
''
