{
  moduleWithSystem,
  lib,
  ...
}: let
  mkVolumeControl = cmd: value: {
    _attrs.allow-when-locked = true;
    spawn-sh = "wpctl ${cmd} @DEFAULT_AUDIO_SINK@ ${value}";
  };
  mkCtl = cmd: {
    _attrs.allow-when-locked = true;
    spawn-sh = "playerctl ${cmd}";
  };
  mkBinding = action: target: dir: {
    "${action}-${target}-${dir}" = null;
  };
  focusWS = ws: {"Mod+${toString ws}".focus-workspace = ws;};
in {
  flake.aspects.niri.config = moduleWithSystem ({self', ...}: {
    settings.binds =
      {
        # program bindings
        "Mod+Shift+Slash".show-hotkey-overlay = null;
        "Mod+SPACE" = {
          _attrs.hotkey-overlay-title = "Application launcher";
          spawn-sh = "${lib.getExe self'.packages.noctalia} ipc call launcher toggle";
        };
        # audio bindings
        "XF86AudioRaiseVolume" = mkVolumeControl "set-volume" "0.1+ -l 1.0";
        "XF86AudioLowerVolume" = mkVolumeControl "set-volume" "0.1-";
        "XF86AudioMute" = mkVolumeControl "set-mute" "toggle";
        # media keys
        "XF86AudioPlay" = mkCtl "play-pause";
        "XF86AudioStop" = mkCtl "stop";
        "XF86AudioPrev" = mkCtl "previous";
        "XF86AudioNext" = mkCtl "next";
        # brightnessctl
        "XF86MonBrightnessUp" = {
          _attrs.allow-when-locked = true;
          spawn = ["brightnessctl" "--class=backlight" "set" "+10%"];
        };
        "XF86MonBrightnessDown" = {
          _attrs.allow-when-locked = true;
          spawn = ["brightnessctl" "--class=backlight" "set" "10%-"];
        };
        # window controls
        "Mod+O" = {
          _attrs.repeat = false;
          toggle-overview = null;
        };
        "Mod+W" = {
          _attrs.repeat = false;
          close-window = null;
        };
        # move focus
        "Mod+Left" = mkBinding "focus" "column" "left";
        "Mod+H" = mkBinding "focus" "column" "left";
        "Mod+Down" = mkBinding "focus" "workspace" "down";
        "Mod+J" = mkBinding "focus" "workspace" "down";
        "Mod+Up" = mkBinding "focus" "workspace" "up";
        "Mod+K" = mkBinding "focus" "workspace" "up";
        "Mod+Right" = mkBinding "focus" "column" "right";
        "Mod+L" = mkBinding "focus" "column" "right";
        # move column
        "Mod+Ctrl+Left" = mkBinding "move" "column" "left";
        "Mod+Ctrl+H" = mkBinding "move" "column" "left";
        "Mod+Ctrl+Up" = mkBinding "move" "column" "to-workspace-up";
        "Mod+Ctrl+K" = mkBinding "move" "column" "to-workspace-up";
        "Mod+Ctrl+Down" = mkBinding "move" "column" "to-workspace-down";
        "Mod+Ctrl+J" = mkBinding "move" "column" "to-workspace-down";
        "Mod+Ctrl+Right" = mkBinding "move" "column" "right";
        "Mod+Ctrl+L" = mkBinding "move" "column" "right";
        # resizing
        "Mod+R".switch-preset-column-width = null;
        "Mod+F".maximize-column = null;
        "Mod+Shift+F".fullscreen-window = null;
        # floating windows
        "Mod+V".toggle-window-floating = null;
        # screenshot and screencasting
        "Ctrl+Shift+P".screenshot-screen = null;
        "Alt+Shift+P".screenshot-window = null;
        # session control
        "Mod+Shift+E".quit = null;
        "Ctrl+Alt+Delete".quit = null;
        "Mod+Shift+P".power-off-monitors = null;
      }
      // lib.mergeAttrsList (lib.map focusWS [1 2 3 4 5 6 7 8 9]);
  });
}
