{
  config,
  pkgs,
  ...
}: {
  programs.eww = {
    enable = true;
    configDir = "~/.config/nix-conf/home-manager/applications/eww/eww";
  };
}
