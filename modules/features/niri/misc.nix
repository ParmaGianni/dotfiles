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
      hotkey-overlay.skip-at-startup = _: {};
      screenshot-path = "~/Documents/screenshots/%Y-%m-%d-%H-%M-%S.png";
      animations = _: {};
      prefer-no-csd = _: {};
    };
  });
}
