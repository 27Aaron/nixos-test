{
  config,
  pkgs,
  ...
}:
{
  systemd.network.networks.eth0 = {
    address = [
      "172.19.16.213/18"
    ];
    gateway = [
      "172.19.63.253"
    ];
    matchConfig.Name = "eth0";
  };

  networking.nameservers = [
    "8.8.8.8"
  ];
}
