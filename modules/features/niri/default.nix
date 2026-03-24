{
  inputs,
  self,
  ...
}: let
  aspect = self.aspects.niri;
in {
  flake.aspects.niri = {
    description = "Scrolling window manager for Wayland.";
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        # optional xwayland integration
        xwayland-satellite
      ];

      programs.niri = {
        enable = true;
        package = self.packages.${pkgs.stdenv.hostPlatform.system}.niri;
      };
    };
  };

  perSystem = {pkgs, ...}: {
    packages.niri = inputs.wrapper-modules.wrappers.niri.wrap {
      imports = with aspect; [config];
      inherit pkgs;
    };
  };
}
