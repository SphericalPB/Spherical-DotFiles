{
  programs.kitty = {
    enable = true;
    font = {
      size = 10;
      name = "Hack";
    };

    settings = {
      scrollback_lines = 10000;
      placement_strategy = "center";

      allow_remote_control = "yes";
      enable_audio_bell = "no";
      visual_bell_duration = "0.1";
      
      tab_bar_edge = "top";
      tab_bar_style = "slant";

      selection_foreground = "none";
      selection_background = "none";

    };

    theme = "Catppuccin-Mocha";
  };
}
