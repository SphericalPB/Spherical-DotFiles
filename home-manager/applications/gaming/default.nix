{
  pkgs,
  inputs,
  outputs,
  ...
}: {
  imports = [
    ./legendary-egl.nix
  ];

  home.packages = [
    # inputs.nix-gaming.packages.${pkgs.system}.<package>
    pkgs.gamemode
    inputs.nix-gaming.pakgages.${pkgs.system}.osu-mime
    inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin
    inputs.nix-gaming.pakgages.${pkgs.system}.osu-stable
    inputs.nix-gaming.pakgages.${pkgs.system}.roblox-player
  ];
}
