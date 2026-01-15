{ pkgs, ... }:

{
  # Install user packages
  environment.systemPackages = with pkgs; [
    libreoffice-qt-fresh
    evince
    ungoogled-chromium
  ];

  # Shell aliases
  programs.zsh.shellAliases = {
    rebuild = "sudo nixos-rebuild switch --flake /home/darkxoa/.config/nixos#enkidu";
  };

}
