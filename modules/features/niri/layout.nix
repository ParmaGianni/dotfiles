{config, ...}: let
  colors = config.lib.stylix.colors;
  shadow = {
    on = null;
    softness = 30;
    spread = 5;
    offset.x = 0;
    offset.y = 5;
    color = "#${colors.base00}";
  };
in {
  flake.aspects.niri.configs = {
    # layout
    settings.layout = {
      inherit shadow;
      gaps = 15;
      center-focused-column = "never";
      preset-column-widths = [
        {proportion = 0.33333;}
        {proportion = 0.5;}
        {proportion = 0.66667;}
      ];
      default-column-width.proportion = 0.5;
      focus-ring = {
        width = 1.5;
        active-gradient.from = "#${colors.base0C}";
        active-gradient.to = "#${colors.base0D}";
        inactive-color = "#${colors.base04}";
        border = {off = null;};
        struts = null;
      };
    };

    # overview
    settings.overview = {
      inherit shadow;
      backdrop-color = "#${colors.base02}";
    };
  };
}
