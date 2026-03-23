{
  inputs,
  config,
  lib,
  ...
}: let
  aspect = config.flake.aspects.noctalia.settings.imports;
  attrs = lib.map (attr: builtins.elemAt attr.imports 0) aspect;
in {
  perSystem = {pkgs, ...}: {
    packages.noctalia = inputs.wrapper-modules.wrappers.noctalia-shell.wrap {
      inherit pkgs;
      settings = lib.mergeAttrsList attrs;
    };
  };
}
