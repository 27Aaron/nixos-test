{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./network.nix
    ../../modules/base
    ../../modules/hardware/vda
    ../../modules/virtualisation/docker.nix
  ];

  systemd.network.enable = true;
  services.resolved.enable = false;
  networking.useDHCP = false;
  networking.hostName = "hostslick";

  system.stateVersion = "25.05";

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    priority = 5;
    memoryPercent = 92;
  };
}
