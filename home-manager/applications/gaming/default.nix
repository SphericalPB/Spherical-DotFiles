{
  pkgs,
  inputs,
  outputs,
  ...
}: {
  imports = [
    ./legendary-egl.nix
    outputs.steamcompattool
  ];

  home.packages = [
    # inputs.nix-gaming.packages.${pkgs.system}.<package>
    pkgs.gamemode
    inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin
    pkgs.grapejuice
  ];
  programs = {
    steam = {
      enable = true;
      package = pkgs.steam.override {
        extraLibraries = pkgs: [pkgs.gperftools pkgs.pkgsi686Linux.gperftools];
      };
      remoteplay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      extraCompatPackages = with pkgs; [proton-ge-bin];
    };
  };
}
