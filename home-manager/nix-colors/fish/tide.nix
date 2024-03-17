{
  config,
  pkgs,
  ...
}: {
  programs.fish = {
    shellInit = ''
      set tide_time_color ${config.colorScheme.palette.base05}
    '';
  };
}
