{
  inputs,
  pkgs,
  lib,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in {
  # allow spotify to be installed if you don't have unfree enabled already
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "spotify"
    ];

  # import the flake's module for your system
  imports = [inputs.spicetify-nix.homeManagerModule];

  # configure spicetify :)
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.Comfy;
    colorScheme = "catppuccin-macchiato";

    enabledExtensions = with spicePkgs.extensions; [
      adblock
      lastfm
      wikify
      fullAppDisplay
      playlistIcons
      genre
      goToSong
      skipOrPlayLikedSongs
      playNext
      shuffle # shuffle+ (special characters are sanitized out of ext names)
      showQueueDuration
      volumePercentage
      autoVolume
      history
      bookmark
      hidePodcasts
    ];
  };
}
