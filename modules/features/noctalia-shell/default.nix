{
  inputs,
  self,
  ...
}: let
  settings = self.lib.flattenAspect self.aspects.noctalia.settings;
in {
  perSystem = {pkgs, ...}: {
    packages.noctalia = inputs.wrapper-modules.wrappers.noctalia-shell.wrap {
      inherit pkgs settings;
    };
  };
}
