{inputs, ...}: {
  perSystem = {pkgs, ...}: {
    packages.zellij = inputs.wrapper-modules.lib.wrapPackage {
      inherit pkgs;
      package = pkgs.zellij;
      flags = {
        "--config" = ./config.kdl;
      };
    };
  };
}
