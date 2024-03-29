{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./eww-notif
  ];

  programs.eww = {
    enable = true;
  };
}
