{
  flake.aspects.virtualization = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        dive
        podman
        podman-tui
        podman-compose
      ];

      virtualisation.containers.enable = true;
      virtualisation.podman = {
        enable = true;
        dockerCompat = true;
        defaultNetwork.settings.dns_enabled = true;
      };
    };

    _.duck-muscles.nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        qemu_kvm
        virt-manager
      ];

      virtualisation.libvirtd = {
        enable = true;
        qemu = {
          package = pkgs.qemu_kvm;
          runAsRoot = true;
          swtpm.enable = true;
        };
      };
    };
  };
}
