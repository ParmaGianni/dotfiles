{inputs, ...}: {
  flake-file.inputs.flox.url = "github:flox/flox/latest";

  flake-file.nixConfig = {
    extra-trusted-substituters = ["https://cache.flox.dev"];
    extra-trusted-public-keys = ["flox-cache-public-1:7F4OyH7ZCnFhcze3fJdfyXYLQw/aV7GEed86nQ7IsOs="];
  };

  flake.aspects.flox.nixos = {pkgs, ...}: {
    environment.systemPackages = [
      inputs.flox.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
