{
  fileSystems."/persistent".neededForBoot = true;

  disko.devices = {
    nodev = {
      "/" = {
        fsType = "tmpfs";
        mountOptions = [
          "relatime"
          "nosuid"
          "nodev"
          "mode=755"
        ];
      };
    };

    disk = {
      vda = {
        type = "disk";
        device = "/dev/vda";
        content = {
          type = "gpt";
          partitions = {
            boot = {
              size = "1M";
              type = "EF02";
              priority = 0;
            };
            ESP = {
              size = "256M";
              type = "EF00";
              content = {
                type = "filesystem";
                extraArgs = [
                  "-n"
                  "BOOT"
                ];
                format = "vfat";
                mountpoint = "/boot";
              };
            };
            # The root partition
            nix = {
              size = "100%";
              content = {
                type = "btrfs";
                extraArgs = [
                  "-f"
                  "--csum xxhash64"
                  "--label NixOS"
                ]; # Override existing partition
                subvolumes = {
                  "@nix" = {
                    mountpoint = "/nix";
                    mountOptions = [
                      "compress-force=zstd:3"
                      "noatime"
                      "discard=async"
                      "space_cache=v2"
                      "nodev"
                      "nosuid"
                    ];
                  };
                  "@persistent" = {
                    mountpoint = "/persistent";
                    mountOptions = [
                      "compress-force=zstd:3"
                      "noatime"
                      "discard=async"
                      "space_cache=v2"
                    ];
                  };
                  "@tmp" = {
                    mountpoint = "/tmp";
                    mountOptions = [
                      "noatime"
                      "discard=async"
                      "space_cache=v2"
                      "nodev"
                      "nosuid"
                    ];
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
