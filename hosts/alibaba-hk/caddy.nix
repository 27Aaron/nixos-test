{ pkgs, ... }:

{
  services.caddy = {
    enable = true;
    virtualHosts."plex.hk.aaron.red".extraConfig = ''
      reverse_proxy 127.0.0.1:62333
    '';

    virtualHosts."alist.hk.aaron.red".extraConfig = ''
      reverse_proxy 127.0.0.1:5244
    '';

    virtualHosts."emby.hk.aaron.red".extraConfig = ''
      reverse_proxy 127.0.0.1:62334
    '';

    virtualHosts."moviepilot.aaron.red".extraConfig = ''
      reverse_proxy 127.0.0.1:3000
    '';
  };
}
