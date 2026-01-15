{ pkgs, ... }:

{

  home-manager.sharedModules = [
    {
      stylix.targets.xyz.enable = true;
    }
  ];

  stylix = {
    enable = true;
    image = ./lavender_twilight.jpg;
    cursor = {
      package = pkgs.capitaine-cursors;
      name = "capitaine-cursors";
      size = 14;
    };
    polarity = "dark";
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.terminess-ttf;
        name = "Terminus Mono";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
    };
  };

}
