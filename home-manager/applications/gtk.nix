{pkgs, ...}: {
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
        accents = ["blue"];
        tweaks = [];
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

    cursorTheme = {
      package = pkgs.oreo-cursors-plus.override {
        cursorsConf = ''
          catppuccin_mocha = color: #24273a, label: #cad3f5, shadow: #1e1e2e, shadow-opacity: 0.4, stroke: #cad3f5, stroke-opacity: 1, stroke-width: 1.5
          sizes = 24, 32, 40, 48, 56, 64
        '';
      };
      name = "oreo_catppuccin_mocha_cursors";
    };

    font = {
      name = "SauceCodePro Nerd Font";
      size = 11;
    };
  };
}
