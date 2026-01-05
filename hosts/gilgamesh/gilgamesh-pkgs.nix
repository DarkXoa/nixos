{ config, pkgs, ... }:


{

  # Disable split lock for game compatability
  boot.kernelParams = [
    "split_lock_mitigate= 0"
  ];

  # Install user packages
  environment.systemPackages = with pkgs; [
    # cachyos-gaming-meta packages
    glfw
    gst_all_1.gst-plugins-base
    giflib
    vulkan-tools
    mpg123
    alsa-plugins
    libxslt
    libjpeg
    wine
    umu-launcher
    gamemode
    winetricks
    openal
  ];

  # Nvidia settings
  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        ocl-icd
        nvidia-vaapi-driver
      ];
      extraPackages32 = with pkgs; [
        ocl-icd
        nvidia-vaapi-driver
      ];
    };
    nvidia = {
      open = false;
      modesetting.enable = true;
    };
  };

  environment.variables.LIBVA_DRIVER_NAME = "nvidia"

  programs
    # Steam settings
    steam = {
      enable = true;
      package = pkgs.steam;
      protontricks = {
        enable = true;
        package = pkgs.protontricks;
      };
      extraCompatPackages = with pkgs; [
        proton-ge-bin
        protonplus
      ];
      extraPkgs = pkgs': with pkgs'; [
        xorg.libXcursor
        xorg.libXi
        xorg.libXinerama
        xorg.libXScrnSaver
        libpng
        libpulseaudio
        libvorbis
        stdenv.cc.cc.lib # Provides libstdc++.so.6
        libkrb5
        keyutils
      ];
      extest.enable = true;
    };
    # OBS Studio settings
    obs-studio = {
      enable = true;
      package = pkgs.obs-studio;
      plugins = with pkgs; [
        obs-backgroundremoval
        obs-command-source
        obs-composite-blur
        obs-gstreamer
        obs-move-transition
        obs-pipewire-audio-capture
        obs-replay-source
        obs-retro-effects
        obs-scale-to-sound
        obs-shaderfilter
        obs-source-clone
        obs-source-record
        obs-text-pthread
        obs-vintage-filter
        obs-vkcapture
        wlrobs
      ];
    };
  };

  # Shell aliases
  programs.zsh.shellAliases = {
    rebuild = "sudo nixos-rebuild switch --flake /home/darkxoa/.config/nixos#gilgamesh";
  };

}
