{inputs, ...}: {
  perSystem = {pkgs, ...}: {
    packages.helix = inputs.wrapper-modules.wrappers.helix.wrap {
      inherit pkgs;
      settings = {
        theme = "dracula";
        editor = {
          cursorline = true;
          cursor-shape.insert = "bar";
          indent-guides = {
            render = true;
            character = "┆"; # Some characters that work well: "▏", "┆", "┊", "⸽"
            skip-levels = 1;
          };
          soft-wrap = {
            enable = true;
            wrap-at-text-width = true;
          };
        };
      };

      languages.language = let
        mkPrettier = name: {
          inherit name;
          auto-format = true;
          formatter = {
            command = "prettier";
            args = ["--parser" "${name}"];
          };
        };
      in [
        {
          name = "rust";
          auto-format = true;
          text-width = 100;
        }
        {
          name = "go";
          formatter = {command = "gopls";};
          auto-format = true;
        }
        {
          name = "nix";
          formatter = {command = "alejandra";};
          auto-format = true;
        }
        (mkPrettier "markdown")
        {
          name = "toml";
          formatter = {
            command = "taplo";
            args = ["format" "-"];
          };
          auto-format = true;
        }
        (mkPrettier "yaml")
      ];
    };
  };
}
