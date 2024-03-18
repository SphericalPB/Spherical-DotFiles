{
  config,
  pkgs,
  ...
}: {
  programs.fish = {
    shellInit = ''
      ## Frame
      # set tide_color_frame_and_connection
      set tide_color_separator_same_color ${config.colorScheme.palette.base04}
      ## OS
      set tide_os_bg_color ${config.colorScheme.palette.base02}
      set tide_os_color ${config.colorScheme.palette.base05}
      ## Directory
      set tide_pwd_bg_color ${config.colorScheme.palette.base03}
      set tide_pwd_color_anchors ${config.colorScheme.palette.base0C}
      set tide_pwd_color_dirs ${config.colorScheme.palette.base0C}
      ## Time
      set tide_time_bg_color ${config.colorScheme.palette.base02}
      set tide_time_color ${config.colorScheme.palette.base0A}
    '';
  };
}
