{
  inputs,
  self,
  withSystem,
  lib,
  flakeRoot,
config,
  cLibs,
  ...
}:
{
  flake = {
    nixosConfigurations = lib.genAttrs (cLibs.mapHosts) (
      name:
      cLibs.mkHost {
      hostname = "nixos-${name}";
      hostProfile = "${name}";
    } );
  };
}
