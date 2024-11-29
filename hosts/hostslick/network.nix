{
  config,
  pkgs,
  ...
}:
{
  systemd.network.networks.eth0 = {
    address = [
      "93.123.118.106/24"
      "2a0f:ca80:1337:9262::1/64"
    ];
    gateway = [
      "93.123.118.1"
    ];
    routes = [
      {
        # Special config since gateway isn't in subnet
        Destination = "::/0";
        Gateway = "2a0f:ca80:1337::1";
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
