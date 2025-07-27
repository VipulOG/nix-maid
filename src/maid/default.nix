{
  pkgs ? import <nixpkgs> { },
  lib ? pkgs.lib,
}:
{
  eval =
    modules:
    (import ./lib.nix { inherit pkgs lib; }).eval {
      inherit modules;
    };
}
