{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:

{
  imports = [
    ../../impermanence
    ../../disko_layout/vda
    (modulesPath + "/profiles/qemu-guest.nix")
  ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    kernelParams = [
      "audit=0"
      "net.ifnames=0"
    ];

    loader.grub = {
      enable = true;
      default = "saved";
      configurationLimit = 5;
      efiSupport = true;
      efiInstallAsRemovable = true;
    };

    initrd = {
      availableKernelModules = [
        "virtio_pci"
        "virtio_blk"
      ];

      kernelModules = [ ];

      compressor = "zstd";
      compressorArgs = [
        "-19"
        "-T0"
      ];

      systemd.enable = true;
    };

    kernelModules = [ ];
    extraModulePackages = [ ];

    tmp = {
      # Clear /tmp on boot to get a stateless /tmp directory.
      cleanOnBoot = true;
    };
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
