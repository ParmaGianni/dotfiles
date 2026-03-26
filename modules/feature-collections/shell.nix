{self, ...}: {
  flake.aspects = {aspects, ...}: {
    shell = {
      includes = with aspects; [
        terminalEmulators
        starship
        yazi
        zsh
      ];

      nixos = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [
          direnv
          just
          fzf
          eza
          ripgrep
          self.packages.${pkgs.stdenv.hostPlatform.system}.zellij
          zoxide
        ];
      };

      homeManager = {
        programs = {
          direnv.enable = true;
          fzf.enable = true;
          eza.enable = true;
          ripgrep.enable = true;
          zoxide.enable = true;
        };
      };
    };
  };
}
