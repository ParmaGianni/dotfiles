{self, ...}: {
  flake.aspects = {aspects, ...}: {
    shell = {
      includes = with aspects; [
        terminalEmulators
        starship
        yazi
        zellij
        zsh
      ];

      nixos = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [
          direnv
          just
          fzf
          eza
          ripgrep
          zoxide
          self.packages.${pkgs.stdenv.hostPlatform.system}.noctalia
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
