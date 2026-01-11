# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [
      ./niri.nix
      ./base-pkgs.nix
      # ./home.nix
      ./style.nix
    ];

  # Bootloader.
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };
    systemd-boot = {
      enable = true;
      };
  };

  # Use latest kernel
  # boot.kernelPackages = pkgs.linuxPackages_latest;

  # Enable networking and bluetooth
  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Volume control
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define user account
  users.users.darkxoa = {
    isNormalUser = true;
    description = "DarkXoa";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "input"
      "libvirtd"
    ];
    useDefaultShell = true;
    packages = with pkgs; [];
  };

  # Default shell
  users.defaultUserShell = pkgs.zsh;
  programs = {
    zsh = {
      enable = true;
      syntaxHighlighting.enable = true;
      autosuggestions.enable = true;
    };
  };

  # Enable CAC reader
  services.pcscd.enable = true;
  programs.ssh.extraConfig = ''
    PKCS11Provider ${pkgs.opensc}/lib/opensc-pkcs11.so
  '';

  # Fuck you spotify
  environment.variables = {
    NIXOS_OZONE_WL = "1";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

  # stylix =  {
  #   enable = true;
  #   image = ./lavender_twilight.jpg;
  #   cursor = {
  #     package = pkgs.capitaine-cursors;
  #     name = "capitaine-cursors";
  #   };
  #   polarity = "dark";
  #   fonts = {
  #     monospace = {
  #         package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
  #         name = "JetBrainsMono Nerd Font Mono";
  #       };
  #     sansSerif = {
  #         package = pkgs.dejavu_fonts;
  #         name = "DejaVu Sans";
  #       };
  #     serif = {
  #         package = pkgs.dejavu_fonts;
  #         name = "DejaVu Serif";
  #     };
  #   };
  # };

}
