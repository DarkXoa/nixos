{ configs, pkgs, ... }:


{
  # Install user packages
  environment.systemPackages = with pkgs; [
    mullvad-browser
    mullvad-vpn
    mpv
    obsidian
    signal-desktop
    spotify
    spicetify-cli
    ungoogled-chromium
    webcord
    winboat
    zapzap
  ];

  virtualisation.docker.enable = true;

  programs = {
    zsh = {
      enable = true;
      syntaxHighlighting.enable = true;
      autosuggestions.enable = true;
    };
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

  # Shell aliases
  # programs.bash.shellAliases = {
  #  rebuild = "nixos-rebuild switch";
  # };

  # Default shell
  users.defaultUserShell = pkgs.zsh;

  # CAC
  services.pcscd.enable = true;
  programs.ssh.extraConfig = ''
    PKCS11Provider ${pkgs.opensc}/lib/opensc-pkcs11.so
  '';

  # Enable flatpak
  services.flatpak.enable = true;

  # Enable AppImages
  programs.appimage = {
    enable = true;
    binfmt = true;
  };


}
