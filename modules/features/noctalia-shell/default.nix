{
  inputs,
  self,
  ...
}: let
  aspect = self.aspects.noctalia;
in {
  perSystem = {pkgs, ...}: {
    packages.noctalia = inputs.wrapper-modules.wrappers.noctalia-shell.wrap {
      imports = with aspect; [config];
      inherit pkgs;
    };
  };
}
