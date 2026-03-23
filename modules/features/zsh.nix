let
  enable = true;
in {
  flake.aspects.zsh = {
    nixos.programs.zsh = {inherit enable;};

    homeManager.programs.zsh = {
      inherit enable;
      shellAliases = {
        "cd" = "z";
        "ls" = "eza --icons=always";
        "pm" = "podman";
        "zz" = "zellij";
      };
      syntaxHighlighting.enable = true;
      autosuggestion.enable = true;
    };
  };
}
