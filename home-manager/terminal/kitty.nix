{
  programs.kitty = {
    enable = true;
    font = {
      size = 11;
      name = "Hack";
    };

    settings = {
      scrollback_lines = 10000;
      placement_strategy = "center";

      allow_remote_control = "yes";
      enable_audio_bell = "no";
      visual_bell_duration = "0.1";

      tab_bar_min_tabs = "1";
      tab_bar_edge = "top";
      tab_bar_align = "left";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      tab_title_template = "{title}{' :{}:'.format(num_windows) if num_windows > 1 else ''}";

      selection_foreground = "none";
      selection_background = "none";
    };

    #theme = "Catppuccin-Mocha";
  };
}
