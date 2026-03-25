{
  flake.aspects.asusd.nixos = {
    services.asusd = {
      enable = true;
    };
  };
}
