# DO-NOT-EDIT. This file was auto-generated using github:vic/flake-file.
# Use `nix run .#write-flake` to regenerate it.
{

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);

  inputs = {
    base16.url = "github:SenchoPens/base16.nix";
    disko.url = "github:nix-community/disko";
    flake-aspects.url = "github:vic/flake-aspects";
    flake-file.url = "github:vic/flake-file";
    flake-parts.url = "github:hercules-ci/flake-parts";
    home-manager.url = "github:nix-community/home-manager";
    import-tree.url = "github:vic/import-tree";
    nix-auto-follow = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:fzakaria/nix-auto-follow";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    sb.url = "github:GianniBuoni/second-brain";
    secrets = {
      flake = false;
      url = "git+ssh://git@github.com/GianniBuoni/secrets.git?ref=main&shallow=1";
    };
    sops-nix.url = "github:Mic92/sops-nix";
    stylix.url = "github:nix-community/stylix";
    systems.url = "github:nix-systems/default";
    wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

}
