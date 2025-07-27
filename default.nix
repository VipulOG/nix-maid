{
  __functor =
    self: pkgs: module:
    ((import ./src/maid { inherit pkgs; }).eval [ module ]).config.build.bundle;

  nixMaidConfiguration =
    {
      pkgs,
      modules,
      specialArgs,
    }:
    ((import ./src/maid/lib.nix { inherit pkgs; }).eval {
      inherit modules specialArgs;
    }).config.build.bundle;

  nixosModules = {
    default = ./src/nixos;
  };
}
