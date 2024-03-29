{
  config,
  pkgs,
  ...
}: {
  programs.eww = {
    enable = true;
    configDir = "/home/sphericalpb/.config/nix-conf/home-manager/applications/eww/eww";
  };
}
