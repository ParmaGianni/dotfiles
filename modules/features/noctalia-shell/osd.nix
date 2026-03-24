{
  flake.aspects.noctalia.config = {
    settings.osd = {
      autoHideMs = 2000;
      backgroundOpacity = 1;
      enabled = true;
      enabledTypes = [0 1 2];
      location = "top_right";
      monitors = [];
      overlayLayer = true;
    };
  };
}
