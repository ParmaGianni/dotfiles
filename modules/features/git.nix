{
  flake.aspects.git = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [git gh forgejo-cli];
    };

    homeManager = {
      lib,
      config,
      ...
    }: let
      enable = true;
      secretPaths = {
        name = "git/user";
        email = "git/email";
      };
      secrets = config.sops.secrets;
    in {
      sops.secrets = {
        ${secretPaths.name} = {};
        ${secretPaths.email} = {};
      };

      programs = {
        gh = {inherit enable;};
        git = {
          inherit enable;
          ignores = [".DS_Store" ".env" ".env.local"];
          settings = {
            init.defaultBranch = "main";
            push.autoSetupRemote = true;
          };
          # IMPURE
          settings.user = lib.mkIf (lib.pathExists secrets.${secretPaths.name}.path) {
            name = builtins.readFile secrets.${secretPaths.name}.path;
            email = builtins.readFile secrets.${secretPaths.email}.path;
          };
          signing.format = null;
        };
        lazygit = {inherit enable;};
      };
    };
  };
}
