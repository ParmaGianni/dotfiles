{
  moduleWithSystem,
  lib,
  ...
}: {
  flake.aspects.niri.config = moduleWithSystem ({self', ...}: {
    settings = {
      spawn-at-startup = [
        (lib.getExe self'.packages.noctalia)
      ];
      hotkey-overlay = {skip-at-startup = null;};
      screenshot-path = "~/Documents/screenshots/%Y-%m-%d-%H-%M-%S.png";
      animations = null;
      prefer-no-csd = null;
    };
  });
}
