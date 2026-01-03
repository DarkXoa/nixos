{ configs, pkgs, ... }:


{
  # Install user packages
  environment.systemPackages = with pkgs; [
    libreoffice-qt-fresh
    evince
    ungoogled-chromium
  ];

  # Shell aliases
  programs.bash.shellAliases = {
   rebuild = "sudo nixos-rebuild switch --flake ~/.config/nixos#enkidu";
  };


}
