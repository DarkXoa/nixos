{ config, pkgs, inputs, ... }:

{

  programs = {
    niri.enable = true;
    hyprlock.enable = true;
  };

  # Services required by niri
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;

  # Desktop environment packages
  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    kitty
    hypridle
    hyprlock
    floorp-bin
    niri
    nano
    nemo-with-extensions
    playerctl
    polkit_gnome
    sddm-sugar-dark
    wl-clipboard
    xwayland-satellite
    zed-editor
    zsh
  ];

  # Set XDG_RUNTIME_DIR for wayland
  environment.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "niri";
    XDG_SESSION_DESKTOP = "niri";
  };

  programs.xwayland.enable = true;
  services.xserver.enable = true;

  # Login manager
  services.displayManager.sddm = {
    wayland.enable = true;
    enable = true;
    theme = "sugar-dark";
    package = pkgs.kdePackages.sddm;
  };

  #Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.iosevka
    nerd-fonts.jetbrains-mono
    liberation_ttf
  ];


}
