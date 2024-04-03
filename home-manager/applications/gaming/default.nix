{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./legendary-egl.nix
  ];

  home.packages = [
    # inputs.nix-gaming.packages.${pkgs.system}.<package>
    pkgs.gamemode
    inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin
    pkgs.grapejuice
  ];
}
