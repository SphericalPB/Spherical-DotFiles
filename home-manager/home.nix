# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
    ./gtk.nix
    .applications/hyprland/hyprland.nix
    #./terminal/shell/fish.nix
    ./terminal/kitty.nix
    ./nix-gaming.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = true;
    };
  };

  # TODO: Set your username
  home = {
    username = "sphericalpb";
    homeDirectory = "/home/sphericalpb";
  };

  home.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  # Add stuff for your user as you see fit:
  programs.neovim.enable = true;

  home.packages = with pkgs; [
    (pkgs.discord.override {
      withOpenASAR = true;
      withVencord = true;
    }) # Installs Discord With Open-ASAR and Vencord
    vesktop # Discord Audio Sharing by Vencord Team
    #steam
    vivaldi
    #obsidian # Waiting support for newer electron versions (25<)
    joplin-desktop
    qimgv
    vlc
    krita
    gromit-mpx # Draw on thy desktop
    # Wayland/Hyprland Stuff
    mako
    swww
    rofi-wayland
    grimblast
    swappy
    hyprpicker
    pyprland
    wlsunset
    wlogout
    # Wine Packages
    (pkgs.wineWowPackages.full.override {
      wineRelease = "staging";
      mingwSupport = true;
    })
    winetricks
    legendary-gl
  ];

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "SphericalPB";
    userEmail = "xdmaxgamer360@gmail.com";
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
