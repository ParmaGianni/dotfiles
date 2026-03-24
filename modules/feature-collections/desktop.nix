{
  flake.aspects = {aspects, ...}: {
    desktop.includes = with aspects; [
      clipboard
      niri
      systemManagement # homeManager import
    ];
  };
}
