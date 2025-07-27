{
  pkgs ? import <nixpkgs> { },
  lib ? pkgs.lib,
}:
let
  utils = import (pkgs.path + /nixos/lib/utils.nix);
in
{
  eval =
    {
      modules ? [ ],
      specialArgs ? { },
    }@args:
    lib.evalModules {
      class = "maid";
      modules = [
        (
          {
            config,
            pkgs,
            lib,
            ...
          }:
          {
            _module.args = {
              inherit ((utils { inherit config pkgs lib; })) systemdUtils;
            };
          }
        )
      ]
      ++ (import ./all-modules.nix)
      ++ args.modules;
      specialArgs = args.specialArgs // {
        inherit pkgs;
      };
    };
}
