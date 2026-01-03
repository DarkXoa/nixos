{ configs, pkgs, ... }:


{
    # Install system packages
    environment.systemPackages = with pkgs; [
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
    ];


  # Install user packages
  environment.systemPackages = with pkgs; [
    mullvad-browser
    mullvad-vpn
    mpv
    obsidian
    protonmail-bridge-gui
    protonmail-desktop
    signal-desktop
    spotify-qt
    librespot
    thunderbird
    webcord
    winboat
    zapzap
  ];

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
