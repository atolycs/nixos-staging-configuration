{
  inputs,
  self,
  withSystem,
  lib,
  flakeRoot,
...
}:
let
  cLibs = import "${flakeRoot}/lib";
in 
{
  
  flake = {
    nixosConfiguration = lib.genAttrs (cLibs.mapHosts) (
      name:
      cLibs.mkHost {
      hostname = "nixos-${name}";
      hostProfile = "${name}";
    } );
  };
}
