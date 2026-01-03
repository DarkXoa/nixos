{
  description = "DarkXoa's Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ...}@inputs: {
    nixosConfigurations = {

      enkidu = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        system = "x86_64-linux";
        modules = [
          ./modules/configuration.nix
          ./hosts/enkidu/enkidu-pkgs.nix
          ./hosts/enkidu/enkidu-hardware.nix
        ];
      };

      # gilgamesh = nixpkgs.lib.nixosSystem {
      #   specialArgs = { inherit inputs; };
      #   system = "x86_64-linux";
      #   modules = [
      #     ./modules/configuration.nix
      #     ./hosts/gilgamesh/gilgamesh-pkgs.nix
      #     ./hosts/gilgamesh/hardware-configuration.nix
      #   ];
      # };

    };
  };
}
