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
  networking.hostName = "racknerd-99";

  system.stateVersion = "24.11";

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    priority = 5;
    memoryPercent = 212;
  };
}
