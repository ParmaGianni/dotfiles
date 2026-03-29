{
  flake.aspects.niri.config = {
    settings.input = {
      keyboard = {
        xkb = _: {};
        numlock = _: {};
      };

      touchpad = {
        tap = _: {};
        natural-scroll = _: {};
      };

      mouse = _: {};
      trackpoint = _: {};
      warp-mouse-to-focus = _: {};
    };
  };
}
