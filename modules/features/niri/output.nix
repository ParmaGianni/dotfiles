let
  monitors = {
    laptop = "Samsung Display Corp. ATNA40CU05-0  Unknown";
    second = "ASUSTek COMPUTER INC PA32UCDM T1LMSB000539";
    pen = "PNP(HAT) Kamvas Pro 19 0xF0000005";
  };

  workspaces = {
    primary = "1";
    secondary = "2";
    gaming = "3";
  };

  programs = {
    browser = "zen-beta";
    notes = "obsidian";
    tty = "com.mitchellh.ghostty";
  };

  mkWorkspace = output: {open-on-output = output;};
in {
  flake.aspects.niri.config = {
    # monitor outputs
    settings.outputs.${monitors.laptop} = {
      mode = "2880x1800@120.000";
      scale = 2;
      transform = "normal";
      position._attrs.x = 0;
      position._attrs.y = 0;
    };

    settings.outputs.${monitors.second} = {
      mode = "3840x2160@120.000";
      scale = 1.75;
      transform = "normal";
      focus-at-startup = null;
      position._attrs.x = 1440;
      position._attrs.y = 0;
    };

    settings.outputs.${monitors.pen} = {off = null;};

    # workspaces
    settings.workspaces = {
      ${workspaces.primary} = mkWorkspace "${monitors.second}";
      ${workspaces.secondary} = mkWorkspace "${monitors.laptop}";
      ${workspaces.gaming} = mkWorkspace "${monitors.second}";
    };

    # window rules
    settings.window-rules = [
      {
        open-on-workspace = "${workspaces.primary}";
        matches = [
          {app-id = "${programs.tty}";}
          {app-id = "${programs.browser}";}
        ];
      }
      {
        open-maximized = true;
        matches = [
          {app-id = "${programs.tty}";}
          {app-id = "${programs.notes}";}
        ];
      }
      {
        open-on-workspace = "${workspaces.secondary}";
        matches = [{app-id = "${programs.notes}";}];
      }
      {
        geometry-corner-radius = 10;
        clip-to-geometry = true;
      }
    ];
  };
}
