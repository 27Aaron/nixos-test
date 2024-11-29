{
  config,
  pkgs,
  ...
}:
{
  systemd.network.networks.eth0 = {
    address = [
      "45.147.51.106/24"
      "2a07:d884:100::15f/48"
    ];
    gateway = [
      "45.147.51.1"
    ];
    routes = [
      {
        # Special config since gateway isn't in subnet
        Destination = "::/0";
        Gateway = "2a07:d884:100::1";
        GatewayOnLink = true;
      }
    ];
    matchConfig.Name = "eth0";
    networkConfig = {
      IPv6AcceptRA = false;
    };
  };

  networking.nameservers = [
    "8.8.8.8"
    "2001:4860:4860::8888"
  ];
}
