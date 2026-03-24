{self, ...}: {
  flake.aspects = {aspects, ...}: {
    textEditing = {
      nixos = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [
          self.packages.${stdenv.hostPlatform.system}.helix
          # lsp
          alejandra
          lua-language-server
          marksman
          nil
          nodePackages.prettier
        ];

        environment.sessionVariables.EDITOR = "hx";
      };

      homeManager = {pkgs, ...}: {
        home.packages = with pkgs; [obsidian];
      };
    };
  };
}
