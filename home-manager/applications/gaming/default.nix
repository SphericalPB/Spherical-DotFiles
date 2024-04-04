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
    osu-lazer-bin
    inputs.nix-gaming.packages.${pkgs.system}.roblox-player
  ];
}
