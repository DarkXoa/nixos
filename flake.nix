{
  description = "DarkXoa's Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
    stylix = {
      url = "github:nix-community/stylix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nix-cachyos-kernel, stylix, home-manager, ...}@inputs: {
    nixosConfigurations = {

      enkidu = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        system = "x86_64-linux";
        modules = [
          # Add CachyOS kernel variants
          ({ pkgs, ... }: {
              nixpkgs.overlays = [ nix-cachyos-kernel.overlays.pinned ];
              boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-bore;
              nix.settings.substituters = [ "https://attic.xuyh0120.win/lantian" ];
              nix.settings.trusted-public-keys = [ "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc=" ];
            })
          stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          ./modules/configuration.nix
          ./hosts/enkidu/enkidu-pkgs.nix
          ./hosts/enkidu/enkidu-hardware.nix
        ];
      };

      gilgamesh = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        system = "x86_64-linux";
        modules = [
          # Add CachyOS kernel variants
          ({ pkgs, ... }: {
              nixpkgs.overlays = [ nix-cachyos-kernel.overlays.pinned ];
              boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-lto;
              nix.settings.substituters = [ "https://attic.xuyh0120.win/lantian" ];
              nix.settings.trusted-public-keys = [ "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc=" ];
            })
          stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          ./modules/configuration.nix
          ./hosts/gilgamesh/gilgamesh-pkgs.nix
          ./hosts/gilgamesh/hardware-configuration.nix
        ];
      };

    };
  };
}
