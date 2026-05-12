{
  config,
  hostname,
  hostProfile,
  inputs,
  self,
  ...
}: 
{
  imports = [
    (./. + "/${hostProfile}/nixos.nix")
  ];
  system = {
      stateVersion = "25.05"
  };
}
