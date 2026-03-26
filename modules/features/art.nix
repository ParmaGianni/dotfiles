{
  flake.aspects.art.homeManager = {pkgs, ...}: {
    home.packages = with pkgs; [
      aseprite
      blender
      godot
      ldtk
      krita
    ];
  };
}
