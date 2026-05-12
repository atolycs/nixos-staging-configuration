args@{self, ...}:

{
  hostname,
  hostProfile,
}:
with args;
inputs.nixpkgs.lib.nixosSystem {
  modules = [
    (
      {config, ...}: {
        nixpkgs.pkgs = withSystem config.nixpkgs.hostPlatform.system (
    { pkgs, ... }:
  pkgs
  );
      }
    )
    (flakeRoot + "/hosts")

  ]
}
