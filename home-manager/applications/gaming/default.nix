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
  programs = {
    steam = {
      enable = true;
      package = pkgs.steam.override {
        extraLibraries = pkgs: [pkgs.gperftools pkgs.pkgsi686Linux.gperftools];
      };
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      # Extra Compatability Packages (custom option by nix-gaming)
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
  };
}
