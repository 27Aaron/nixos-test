{
  environment = {
    persistence."/persistent" = {
      hideMounts = true;
      directories = [
        "/etc/NetworkManager/system-connections"
        "/etc/nixos"

        "/var/log"
        "/var/lib"
      ];
      files = [
        # "/etc/machine-id"
      ];
      users.aaron = {
        directories = [
          "nix-config"

          "Downloads"
          "Music"
          "Pictures"
          "Documents"
          "Videos"

          {
            directory = ".gnupg";
            mode = "0700";
          }
          {
            directory = ".ssh";
            mode = "0700";
          }
          {
            directory = ".docker";
            mode = "0700";
          }

        ];
        files = [ ];
      };
    };
  };
}
