{
  config,
  pkgs,
  ...
}:
{
  systemd.network.networks.eth0 = {
    DHCP = "yes";
    matchConfig.Name = "eth0";
  };

  networking.nameservers = [
    "8.8.8.8"
    "2001:4860:4860::8888"
  ];
}
