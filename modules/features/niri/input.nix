{
  flake.aspects.niri.config = {
    settings.input = {
      keyboard = {
        xkb = null;
        numlock = null;
      };

      touchpad = {
        tap = null;
        natural-scroll = null;
      };

      mouse = null;
      trackpoint = null;
      warp-mouse-to-focus = null;
    };
  };
}
