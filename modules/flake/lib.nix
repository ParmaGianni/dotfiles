{
  inputs,
  config,
  ...
}: let
  self = config.flake.modules;
in {
  flake.lib = {
    # constants
    clusterHosts = let
      clusterName = "sleepy-gary";
      clusterData = [
        {
          name = "${clusterName}-00";
          value = {hardware = "amd";};
        }
        {
          name = "${clusterName}-02";
          value = {hardware = "intel";};
        }
      ];
    in
      builtins.listToAttrs clusterData;

    # functions
    mkUser = userName: config.flake.aspects.${userName};
    mkNixosHost = hostName: opts:
      inputs.nixpkgs.lib.nixosSystem {
        pkgs = import inputs.nixpkgs {
          inherit (opts.hostData) system;
          config.allowUnfree = true;
        };
        specialArgs = {inherit inputs;};
        modules = [
          # import options and host modules
          self.flake.options
          self.nixos.${hostName}
          # inherit flake's config settings
          {config = opts;}
          # set state version
          {system = {inherit (opts.hostData) stateVersion;};}
        ];
      };

    # disko functions
    # boot partition
    mkEsp = size: {
      inherit size;
      type = "EF00";
      content = {
        type = "filesystem";
        format = "vfat";
        mountpoint = "/boot";
        mountOptions = ["umask=0077"];
      };
    };
    # basic filesystem, formats the disk to any specified
    # filesystem type
    mkFs = format: size: mountpoint: {
      inherit size;
      content = {
        inherit mountpoint format;
        type = "filesystem";
      };
    };
    # Creates interactive luks partiton: it will ask for a password on boot.
    # Using this function does not require the `luks` aspect on the host.
    mkInteractiveLuks = size: {
      inherit size;
      content = {
        type = "luks";
        name = "crypted";
        passwordFile = "/tmp/luks.key";
        settings.allowDiscards = true;
        content = {
          type = "lvm_pv";
          vg = "vg";
        };
      };
    };
    # Creates luks partition.
    # Using function requires host to include `luks` aspect.
    mkLuks = size: {
      inherit size;
      content = {
        type = "luks";
        name = "crypted";
        settings = {
          allowDiscards = true;
          keyFile = "/dev/disk/by-uuid/2522-06ED";
          keyFileSize = 4096;
        };
        content = {
          type = "lvm_pv";
          vg = "vg";
        };
      };
    };
    # Empty partition, useful for Ceph OSD creation
    mkEmpty = size: {inherit size;};
    # Basic swap partition
    mkSwap = size: {
      inherit size;
      content = {
        type = "swap";
        discardPolicy = "both";
      };
    };
  };
}
