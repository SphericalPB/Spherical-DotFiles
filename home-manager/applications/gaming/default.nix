{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./legendary-egl.nix
  ];

  home.packages = with pkgs; [
    # inputs.nix-gaming.packages.${pkgs.system}.<package>
    gamemode
    protonup-qt
    osu-lazer-bin
  ];
}
