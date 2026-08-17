let
  nixpkgs = builtins.getFlake "git+https://github.com/nixos/nixpkgs?ref=nixos-unstable&shallow=1";
  pkgs = import nixpkgs { system = builtins.currentSystem; };
in
pkgs.runCommand "test" {
  nativeBuildInputs = with pkgs; [ pkg-config ];
  buildInputs = with pkgs; [ mpv ];
}
''
  echo \#; pkg-config --list-all; echo \#; # exit 1
''
