{
  inputs,
  lib,
  ...
}: {
  flake-file.inputs = {
    base16.url = "github:SenchoPens/base16.nix";
    flake-aspects.url = "github:vic/flake-aspects";
    flake-file.url = "github:vic/flake-file";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    systems.url = "github:nix-systems/default";
    wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";
  };

  flake-file.outputs = ''inputs: inputs.flake-parts.lib.mkFlake {inherit inputs;} (inputs.import-tree ./modules)'';

  imports = with inputs; [
    flake-file.flakeModules.default
    # flake-file.flakeModules.nix-auto-follow
    flake-aspects.flakeModule
  ];

  systems = lib.mkDefault (import inputs.systems);
}
