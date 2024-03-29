{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./eww-notif.nix
  ];

  programs.eww = {
    enable = true;
  };
}
