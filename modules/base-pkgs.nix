{ config, pkgs, ... }:


{

  environment.systemPackages = with pkgs; [
  # Install system packages
    capitaine-cursors
    fastfetch
    gh
    git
    libvirt
    neovim
    networkmanager
    nix-search-tv
    qemu_full
    television
    virt-manager
    wget
  # Install user packages
    mullvad-browser
    mpv
    obsidian
    protonmail-bridge-gui
    protonmail-desktop
    signal-desktop
    spotify
    spicetify-cli
    thunderbird
    webcord
    winboat
    zapzap
  ];

  # Mullvad VPN services
  services = {
    resolved.enable = true;
    mullvad-vpn = {
      enable = true;
      package = pkgs.mullvad-vpn;
    };
  };

  # Enable docker for winboat
  virtualisation.docker.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable flatpak
  services.flatpak.enable = true;

  # Enable AppImages
  programs.appimage = {
    enable = true;
    binfmt = true;
  };


}
