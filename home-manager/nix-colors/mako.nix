{
  pkgs,
  config,
  ...
}: {
  services.mako = {
    backgroundColor = "#${config.colorScheme.palette.base01}";
    textColor = "#${config.colorScheme.palette.base05}";
    borderColor = "#${config.colorScheme.palette.base0E}";
    progressColor = "#${config.colorScheme.palette.base0B}";
  };
}
