{
  moduleWithSystem,
  lib,
  ...
}: let
  mkVolumeControl = cmd: value: (
    _: {
      props.allow-when-locked = true;
      content.spawn-sh = "wpctl ${cmd} @DEFAULT_AUDIO_SINK@ ${value}";
    }
  );
  mkCtl = cmd: (
    _: {
      props.allow-when-locked = true;
      content.spawn-sh = "playerctl ${cmd}";
    }
  );
  mkBinding = action: target: dir: {
    "${action}-${target}-${dir}" = _: {};
  };
  focusWS = ws: {"Mod+${toString ws}".focus-workspace = ws;};
in {
  flake.aspects.niri.config = moduleWithSystem ({self', ...}: {
    settings.binds =
      {
        # program bindings
        "Mod+Shift+Slash".show-hotkey-overlay = _: {};
        "Mod+SPACE" = _: {
          props.hotkey-overlay-title = "Application launcher";
          content.spawn-sh = "${lib.getExe self'.packages.noctalia} ipc call launcher toggle";
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
        "XF86MonBrightnessUp" = _: {
          props.allow-when-locked = true;
          content.spawn = ["brightnessctl" "--class=backlight" "set" "+10%"];
        };

        "XF86MonBrightnessDown" = _: {
          props.allow-when-locked = true;
          content.spawn = ["brightnessctl" "--class=backlight" "set" "10%-"];
        };
        # window controls
        "Mod+O" = _: {
          props.repeat = false;
          content.toggle-overview = _: {};
        };
        "Mod+W" = _: {
          props.repeat = false;
          content.close-window = _: {};
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
        "Mod+R".switch-preset-column-width = _: {};
        "Mod+F".maximize-column = _: {};
        "Mod+Shift+F".fullscreen-window = _: {};
        # floating windows
        "Mod+V".toggle-window-floating = _: {};
        # screenshot and screencasting
        "Ctrl+Shift+P".screenshot-screen = _: {};
        "Alt+Shift+P".screenshot-window = _: {};
        # session control
        "Mod+Shift+E".quit = _: {};
        "Ctrl+Alt+Delete".quit = _: {};
        "Mod+Shift+P".power-off-monitors = _: {};
      }
      // lib.mergeAttrsList (lib.map focusWS [1 2 3 4 5 6 7 8 9]);
  });
}
