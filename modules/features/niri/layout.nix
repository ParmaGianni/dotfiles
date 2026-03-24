{
  inputs,
  moduleWithSystem,
  ...
}: {
  flake.aspects.niri.config = moduleWithSystem ({pkgs, ...}: let
    base16 = pkgs.callPackage (inputs.base16.lib) {};
    colors = base16.mkSchemeAttrs "${pkgs.base16-schemes}/share/themes/dracula.yaml";

    shadow = {
      on = null;
      softness = 30;
      spread = 5;
      offset._attrs.x = 0;
      offset._attrs.y = 5;
      color = "${colors.withHashtag.base00}";
    };
  in {
    # layout
    settings.layout = with colors.withHashtag; {
      inherit shadow;
      border = {off = null;};
      struts = null;
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
        active-gradient._attrs.from = base0C;
        active-gradient._attrs.to = base0D;
        inactive-color = base04;
      };
    };

    # overview
    settings.overview = with colors.withHashtag; {
      workspace-shadow = shadow;
      backdrop-color = base02;
    };
  });
}
