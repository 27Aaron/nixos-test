{
  description = "Aaron's NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence.url = "github:nix-community/impermanence";
  };

  outputs =
    inputs@{
      nixpkgs,
      disko,
      impermanence,
      ...
    }:
    {
      nixosConfigurations = {
        alibaba-hk = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/alibaba-hk
            disko.nixosModules.disko
            impermanence.nixosModules.impermanence
          ];
        };
      };

      nixosConfigurations = {
        racknerd-99 = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/racknerd-99
            disko.nixosModules.disko
            impermanence.nixosModules.impermanence
          ];
        };
      };

      nixosConfigurations = {
        hostslick = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/hostslick
            disko.nixosModules.disko
            impermanence.nixosModules.impermanence
          ];
        };
      };
    };
}
