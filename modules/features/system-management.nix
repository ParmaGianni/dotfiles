{
  flake.aspects.systemManagement = {
    description = "Tools for managing system state and hardware inspection";

    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        bashmount
        btop
        efibootmgr
        exiftool
        fastfetch
        lshw
        pciutils
        pstree
        trash-cli
        upower
        unzip
      ];

      services.power-profiles-daemon.enable = true;
      security.rtkit.enable = true;
    };

    homeManager = {pkgs, ...}: {
      home.packages = with pkgs; [
        libnotify # Mako dependency
        blueman
        pavucontrol
        networkmanagerapplet
      ];

      services.mako.enable = true;
      services.wpaperd.enable = true;
    };
  };
}
