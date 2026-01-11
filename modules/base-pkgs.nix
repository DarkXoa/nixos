{ config, pkgs, ... }:


{

  environment.systemPackages = with pkgs; [
  # Install system packages
    btop
    fastfetch
    geekbench
    gh
    git
    libvirt
    libxcb-cursor
    neovim
    networkmanager
    nix-search-tv
    nvtopPackages.nvidia
    qemu_full
    television
    virt-manager
    wget
  # Install user packages
    altus
    mullvad-browser
    mpv
    obsidian
    protonmail-desktop
    signal-desktop
    spotify
    spicetify-cli
    thunderbird
    webcord
    winboat
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
