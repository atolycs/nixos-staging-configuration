{
  description = "Atolycs Nix configuration";

  inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
      nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
      flake-parts.url = "github:hercules-ci/flake-parts";
      home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs-unstable";
      };
      import-tree.url = "github:vic/import-tree";
  };
  outputs = inputs@{flake-parts, import-tree, self,...}: 
    flake-parts.lib.mkFlake { inherit inputs; } 
    {
        imports = [
          (import-tree [
            ./modules/flake-parts
          ])
        ];

        perSystem = {config, self', inputs', pkgs, system, ...}: {
          _module.args.pkgs = import inputs.nixpkgs {
             inherit system;
          };
        };
    };
}
