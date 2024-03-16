{
  pkgs,
  config,
  ...
}: {
  programs = {
    kitty = {
      enable = true;
      settings = {
        # Text Color
        foreground = "#${config.colorScheme.palette.base05}";
        # Background Color
        background = "#${config.colorScheme.palette.base00}";

        # Cursor colors
        #cursor                  #F5E0DC
        #cursor_text_color       #1E1E2E

        # URL underline color when hovering with mouse
        #url_color               #F5E0DC

        # Kitty window border colors
        #active_border_color     #B4BEFE
        #inactive_border_color   #6C7086
        #bell_border_color       #F9E2AF

        # OS Window titlebar colors
        #wayland_titlebar_color  #1E1E2E
        #macos_titlebar_color    #1E1E2E

        # Tab bar colors
        active_tab_foreground = "#${config.colorScheme.palette.base01}";
        active_tab_background = "#${config.colorScheme.palette.base07}";
        inactive_tab_foreground = "#${config.colorScheme.palette.base05}";
        inactive_tab_background = "#${config.colorScheme.palette.base03}";
        tab_bar_background = "#${config.colorScheme.palette.base02}";

        # Colors for marks (marked text in the terminal)
        #mark1_foreground #1E1E2E
        #mark1_background #B4BEFE
        #mark2_foreground #1E1E2E
        #mark2_background #CBA6F7
        #mark3_foreground #1E1E2E
        #mark3_background #74C7EC

        # Black
        color0 = "#${config.colorScheme.palette.base03}";
        color8 = "#${config.colorScheme.palette.base04}";

        # Red
        color1 = "#${config.colorScheme.palette.base08}";
        color9 = "#${config.colorScheme.palette.base08}";

        # Green
        color2 = "#${config.colorScheme.palette.base0B}";
        color10 = "#${config.colorScheme.palette.base0B}";

        # Yellow
        color3 = "#${config.colorScheme.palette.base0A}";
        color11 = "#${config.colorScheme.palette.base0A}";

        # Blue
        color4 = "#${config.colorScheme.palette.base07}";
        color12 = "#${config.colorScheme.palette.base07}";

        # Magenta
        color5 = "#${config.colorScheme.palette.base0E}";
        color13 = "#${config.colorScheme.palette.base0E}";

        # Cyan
        color6 = "#${config.colorScheme.palette.base0C}";
        color14 = "#${config.colorScheme.palette.base0C}";

        # White
        color7 = "#${config.colorScheme.palette.base05}";
        color15 = "#${config.colorScheme.palette.base05}";
      };
    };
  };
}
