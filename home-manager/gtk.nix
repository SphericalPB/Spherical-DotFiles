{ pkgs, ... }:

{
  home.packages = with pkgs; [
    dconf
  ];

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.catppuccin-gtk.override {
       	variant = "macchiato";
	size = "standard";
	accents = [ "blue" ];
	tweaks = [ ];
      };
      name = "Catppuccin-Macchiato-Standard-Blue-Dark";
    };

    iconTheme = {
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "macchiato";
        accent = "yellow";
      };
      name = "Papirus";
    };

    font = {
      name = "SauceCodePro Nerd Font";
      size = 11;
    };
  };
}

