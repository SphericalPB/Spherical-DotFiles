{
  pkgs,
  config,
  ...
}: {
  xdg.configFile."btop/themes".source = ./themes;

  programs.btop = {
    enable = true;
    settings = {
      color_theme = "catppuccin_macchiato";
      theme_background = false;
      truecolor = true;
      vim_keys = true;
    };
  };
}
