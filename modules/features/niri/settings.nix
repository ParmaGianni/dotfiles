# Check the wiki for a full description of the configuration:
# https://yalter.github.io/niri/
{
  flake.aspects.niri.homeManager = {config, ...}: let
    # monitors
    laptop-monitor = "Samsung Display Corp. ATNA40CU05-0  Unknown";
    second-monitor = "ASUSTek COMPUTER INC PA32UCDM T1LMSB000539";
    pen-monitor = "PNP(HAT) Kamvas Pro 19 0xF0000005";
    # workspaces
    ws1 = "primary";
    ws2 = "secondary";
    ws3 = "gaming";
    # programs
    browser = "zen-beta";
    notes = "obsidian";
    tty = "com.mitchellh.ghostty";
    bar = "waybar";
    # colors
    colors = config.lib.stylix.colors;
  in {
    xdg.configFile."niri/config.kdl".text = ''
      input {
          keyboard {
              xkb {}
              numlock
          }
          touchpad {
              tap
              natural-scroll
          }
          mouse {}
          trackpoint {}
          warp-mouse-to-focus
      }

      cursor {
          hide-when-typing
          xcursor-size 16
      }

      output "${laptop-monitor}" {
          mode "2880x1800@120.000"
          scale 2
          transform "normal"
          position x=0 y=0
      }
      output "${second-monitor}" {
          mode "3840x2160@120.000"
          scale 1.75
          transform "normal"
          focus-at-startup
          position x=1440 y=0
      }
      output "${pen-monitor}" { off; }

      workspace "${ws1}" { open-on-output "${second-monitor}"; }
      workspace "${ws2}" { open-on-output "${laptop-monitor}"; }
      workspace "${ws3}" { open-on-output "${second-monitor}"; }

      window-rule {
          match app-id="${tty}"
          match app-id="${browser}"
          open-on-workspace "${ws1}"
      }
      window-rule {
          match app-id="${tty}"
          open-maximized true
      }
      window-rule {
          match app-id="${notes}"
          open-on-workspace "${ws2}"
          open-maximized true
      }

      layout {
          gaps 15
          center-focused-column "never"
          preset-column-widths {
              proportion 0.33333
              proportion 0.5
              proportion 0.66667
          }
          default-column-width { proportion 0.5; }
          focus-ring {
              width 1.5
              active-gradient from="#${colors.base0C}" to="#${colors.base0D}" angle=0
              // inactive color only visible on inactive monitors
              inactive-color "${colors.base04}"
              // per-window gradient syntax
              // per-workspace gradient syntax
              // inactive-gradient from="#505050" to="#808080" angle=45 relative-to="workspace-view"
          }
          // Mutually exclusive to focus ring
          border { off; }
          shadow {
              on
              softness 30
              spread 5
              offset x=0 y=5
              color "#${colors.base00}"
          }
          struts {}
      }

      overview {
          backdrop-color "#${colors.base02}"
          workspace-shadow {
              on
              softness 30
              spread 5
              offset x=0 y=5
              color "#${colors.base00}"
          }
      }
      // startup
      spawn-at-startup "${bar}"
      hotkey-overlay { skip-at-startup; }
      screenshot-path "~/Documents/screenshots/%Y-%m-%d-%H-%M-%S.png"
      animations {}
      // removes window decorations
      prefer-no-csd
      window-rule {
          geometry-corner-radius 10
          clip-to-geometry true
      }
      binds {
          Mod+Shift+Slash { show-hotkey-overlay; }

          // program bindings
          Mod+SPACE hotkey-overlay-title="Run an Application: fuzzel" { spawn "fuzzel"; }
          ALT+SPACE hotkey-overlay-title="Emoji picker: bemoji" {
              spawn-sh "bemoji -t";
          }
          Super+Alt+L hotkey-overlay-title="Lock the Screen: swaylock" { spawn "swaylock"; }
          // audio bindings
          XF86AudioRaiseVolume allow-when-locked=true { spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+ -l 1.0"; }
          XF86AudioLowerVolume allow-when-locked=true { spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-"; }
          XF86AudioMute        allow-when-locked=true { spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"; }
          XF86AudioMicMute     allow-when-locked=true { spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"; }
          // media keys mapping using playerctl.
          XF86AudioPlay        allow-when-locked=true { spawn-sh "playerctl play-pause"; }
          XF86AudioStop        allow-when-locked=true { spawn-sh "playerctl stop"; }
          XF86AudioPrev        allow-when-locked=true { spawn-sh "playerctl previous"; }
          XF86AudioNext        allow-when-locked=true { spawn-sh "playerctl next"; }
          // brightnessctl bindings
          XF86MonBrightnessUp allow-when-locked=true { spawn "brightnessctl" "--class=backlight" "set" "+10%"; }
          XF86MonBrightnessDown allow-when-locked=true { spawn "brightnessctl" "--class=backlight" "set" "10%-"; }
          // Open/close the Overview: a zoomed-out view of workspaces and windows.
          // You can also move the mouse into the top-left hot corner,
          // or do a four-finger swipe up on a touchpad.
          Mod+O repeat=false { toggle-overview; }
          Mod+W repeat=false { close-window; }
          // move focus
          Mod+Left  { focus-column-left; }
          Mod+Down  { focus-workspace-down; }
          Mod+Up    { focus-workspace-up; }
          Mod+Right { focus-column-right; }
          Mod+H     { focus-column-left; }
          Mod+J     { focus-workspace-down; }
          Mod+K     { focus-workspace-up; }
          Mod+L     { focus-column-right; }
          // move columns
          Mod+Ctrl+Left  { move-column-left; }
          Mod+Ctrl+Down  { move-column-to-workspace-down; }
          Mod+Ctrl+Up    { move-column-to-workspace-up; }
          Mod+Ctrl+Right { move-column-right; }
          Mod+Ctrl+H     { move-column-left; }
          Mod+Ctrl+J     { move-column-to-workspace-down; }
          Mod+Ctrl+K     { move-column-to-workspace-up; }
          Mod+Ctrl+L     { move-column-right; }
          // focus monitors
          Mod+Shift+Left  { focus-monitor-left; }
          Mod+Shift+Down  { focus-monitor-down; }
          Mod+Shift+Up    { focus-monitor-up; }
          Mod+Shift+Right { focus-monitor-right; }
          Mod+Shift+H     { focus-monitor-left; }
          Mod+Shift+J     { focus-monitor-down; }
          Mod+Shift+K     { focus-monitor-up; }
          Mod+Shift+L     { focus-monitor-right; }
          // workspace bindings
          Mod+1 { focus-workspace 1; }
          Mod+2 { focus-workspace 2; }
          Mod+3 { focus-workspace 3; }
          Mod+4 { focus-workspace 4; }
          Mod+5 { focus-workspace 5; }
          Mod+6 { focus-workspace 6; }
          Mod+7 { focus-workspace 7; }
          Mod+8 { focus-workspace 8; }
          Mod+9 { focus-workspace 9; }
          Mod+Ctrl+1 { move-column-to-workspace 1; }
          Mod+Ctrl+2 { move-column-to-workspace 2; }
          Mod+Ctrl+3 { move-column-to-workspace 3; }
          Mod+Ctrl+4 { move-column-to-workspace 4; }
          Mod+Ctrl+5 { move-column-to-workspace 5; }
          Mod+Ctrl+6 { move-column-to-workspace 6; }
          Mod+Ctrl+7 { move-column-to-workspace 7; }
          Mod+Ctrl+8 { move-column-to-workspace 8; }
          Mod+Ctrl+9 { move-column-to-workspace 9; }
          // resizing
          Mod+R { switch-preset-column-width; }
          Mod+Shift+R { switch-preset-window-height; }
          Mod+Ctrl+R { reset-window-height; }
          Mod+F { maximize-column; }
          Mod+Shift+F { fullscreen-window; }
          // floating windows
          Mod+V       { toggle-window-floating; }
          Mod+Shift+V { switch-focus-between-floating-and-tiling; }
          // sreenshot & screencasting
          Ctrl+Shift+P { screenshot-screen; }
          Alt+Shift+P { screenshot-window; }
          Mod+Escape allow-inhibiting=false { toggle-keyboard-shortcuts-inhibit; }
          // session quit
          Mod+Shift+E { quit; }
          Ctrl+Alt+Delete { quit; }
          // Powers off the monitors. To turn them back on, do any input like
          // moving the mouse or pressing any other key.
          Mod+Shift+P { power-off-monitors; }
      }
    '';
  };
}
