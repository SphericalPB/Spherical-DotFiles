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
    #inputs.nix-colors.homeManagerModule

    # Nix-Index Database
    inputs.nix-index-database.hmModules.nix-index

    # You can also split up your configuration and import pieces of it here:
    ./nix-colors.nix
    ./applications
    ./terminal
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

  home = {
    username = "sphericalpb";
    homeDirectory = "/home/sphericalpb";
  };

  home.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  #colorScheme = inputs.nix-colors.colorSchemes.dracula;

  # Add stuff for your user as you see fit:
  programs = {
    neovim.enable = true;
    home-manager.enable = true;
    git = {
      enable = true;
      userName = "SphericalPB";
      userEmail = "xdmaxgamer360@gmail.com";
    };
    #nix-index-database.comma.enable = true
  };

  home.packages = with pkgs; [
    qimgv
    vlc
    krita
    gromit-mpx # Draw on thy desktop
    cinnamon.nemo-with-extensions
    libreoffice-fresh
    pavucontrol
    #obsidian # Waiting support for newer electron versions (25<)
    # Wayland/Hyprland Stuff
    swww
    rofi-wayland
    grimblast
    swappy
    #pyprland
    wlsunset
    wlogout
    # Wine Packages
    (wineWowPackages.full.override {
      wineRelease = "staging";
      mingwSupport = true;
    })
    winetricks
    bottles
    legendary-gl # Commandline tool for EpicGames
    # Installs Discord with Vencord and OpenASAR
    (discord.override {
      withOpenASAR = true;
      withVencord = true;
    })
    vesktop # Basically Webcord with Vencord
    # Installs Vivaldi with proprietary video codecs
    (vivaldi.override {
      proprietaryCodecs = true;
      enableWidevine = false;
    })
    vivaldi-ffmpeg-codecs
    widevine-cdm
  ];

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
