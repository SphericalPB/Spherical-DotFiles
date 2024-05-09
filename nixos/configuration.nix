# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules from other flakes
    # (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # xremap
    #inputs.xremap-flake.nixosModules.default

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
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
    };
  };

  # This will add each flake input as a registry
  # To make nix3 commands consistent with your flake
  nix.registry = (lib.mapAttrs (_: flake: {inherit flake;})) ((lib.filterAttrs (_: lib.isType "flake")) inputs);

  # This will additionally add your inputs to the system's legacy channels
  # Making legacy nix commands consistent as well, awesome!
  nix.nixPath = ["/etc/nix/path"];
  environment.etc =
    lib.mapAttrs'
    (name: value: {
      name = "nix/path/${name}";
      value.source = value.flake;
    })
    config.nix.registry;

  nix.settings = {
    # Enable flakes and new 'nix' command
    experimental-features = ["nix-command" "flakes"];
    # Deduplicate and optimize nix store
    auto-optimise-store = true;
    # Cachix Stuff
    substituters = [
      "https://hyprland.cachix.org"
      "https://nix-gaming.cachix.org"
    ];
    trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
    ];
  };

  # Kernel Stuff
  boot = {
    initrd.kernelModules = ["amdgpu" "i2c-dev" "i2c-piix4"];
    # Spherical Note: amdgpu.dc=0 | Black Screen Fix for DVI/VGA Monitors
    kernelParams = ["amdgpu.dc=0"];
    kernelPackages = pkgs.linuxPackages_xanmod_latest;

    # Preferred Bootloader ( GRUB )
    loader = {
      efi = {
        efiSysMountPoint = "/boot";
        canTouchEfiVariables = true;
      };
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
      };
    };
  };

  # Enable Networking
  networking = {
    hostName = "Spherical-NixOS";
    networkmanager = {
      enable = true;
      insertNameservers = ["1.1.1.1" "1.0.0.1"];
    };
    firewall = {
      enable = true;
      allowedTCPPorts = [53317 8384 22000];
      allowedUDPPorts = [22000 21027];
    };
  };

  # Time Zone
  time.timeZone = "Asia/Manila";

  # System Locale
  i18n = {
    defaultLocale = "en_PH.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_PH.UTF-8";
      LC_IDENTIFICATION = "en_PH.UTF-8";
      LC_MEASUREMENT = "en_PH.UTF-8";
      LC_MONETARY = "en_PH.UTF-8";
      LC_NAME = "en_PH.UTF-8";
      LC_NUMERIC = "en_PH.UTF-8";
      LC_PAPER = "en_PH.UTF-8";
      LC_TELEPHONE = "en_PH.UTF-8";
      LC_TIME = "en_PH.UTF-8";
    };
  };

  hardware = {
    # 3D Graphics Stuff
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = [pkgs.mesa.drivers pkgs.amdvlk];
      extraPackages32 = [pkgs.driversi686Linux.mesa.drivers pkgs.driversi686Linux.amdvlk];
    };
    # Setup Tablet with OpenTabletDriver
    opentabletdriver.enable = true;
  };

  services = {
    # X11
    xserver = {
      enable = true;
      videoDrivers = ["amdgpu"];
      displayManager.sddm.enable = true;

      windowManager.awesome = {
        enable = true;
        luaModules = with pkgs.luaPackages; [
          luarocks
          luadbi-mysql
        ];
      };

      # Configure Keymaps in X11
      xkb = {
        layout = "us(colemak_dh),ph";
        options = "grp:alt_shift_toggle,caps:backspace,shift:both_capslock";
      };
    };

    gvfs.enable = true;

    syncthing = {
      enable = true;
      openDefaultPorts = true;
      guiAddress = "127.0.0.1:8384";
      user = "sphericalpb";
      group = "users";
      dataDir = "/home/sphericalpb/.local/share/syncthing";
      configDir = "/home/sphericalpb/.config/syncthing";
      overrideDevices = true;
      overrideFolders = true;
      # I still have zero idea how to make this actually work
      settings = {
        devices = {
          "Spherical-Tablet" = {id = "FT4YV2Q-P3G72Y4-O6DXAKA-XUZF4EX-BU7ZOQU-YKNKLGG-INQAQI5-WU2KKQN";};
          "Spherical-Oppo" = {id = "K6POAM7-Z556ZKR-VLTG57G-J7LZNUG-FQ4TFEA-447R6WS-RLVKU7F-KCMEVA3";};
        };
        folders = {
          "Pictures" = {
            id = "5h63m-h4upu";
            path = "/home/sphericalpb/Pictures";
            devices = ["Spherical-Tablet" "Spherical-Oppo"];
            versioning = {
              type = "trashcan";
              params.cleanoutDays = "30";
            };
          };

          "Pinterest" = {
            id = "s2j7h-9v0it";
            path = "/home/sphericalpb/Pictures/Pinterest";
            devices = ["Spherical-Tablet" "Spherical-Oppo"];
          };

          "Music-Stuff" = {
            id = "mzeqq-kle9m";
            path = "/home/sphericalpb/Music";
            devices = ["Spherical-Tablet" "Spherical-Oppo"];
          };

          "Obsidian-Vault" = {
            id = "goywh-lr6bw";
            path = "/home/sphericalpb/Documents/Obsidian-Vault";
            devices = ["Spherical-Tablet" "Spherical-Oppo"];
          };
          "School-Stuff" = {
            id = "aniky-jpbvd";
            path = "/home/sphericalpb/Documents/schoo";
            devices = ["Spherical-Tablet" "Spherical-Oppo"];
            versioning = {
              type = "trashcan";
              params.cleanoutDays = "30";
            };
          };
        };
      };
    };

    # Managing Audio with Pipewire
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      #jack.enable = true;
    };
    # CUPS Printing
    printing = {
      enable = true;
      drivers = [pkgs.gutenprint];
    };
  };

  virtualisation.waydroid.enable = true;

  security = {
    rtkit.enable = true; # Recommended for Pipewire stuff
    polkit.enable = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs = {
    fish.enable = true;
    gamemode.enable = true;
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      xwayland.enable = true;
    };

    steam = {
      enable = true;
      package = pkgs.steam.override {
        extraLibraries = pkgs: [pkgs.gperftools pkgs.pkgsi686Linux.gperftools];
      };
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
  };

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = ["graphical-session.target"];
      wants = ["graphical-session.target"];
      after = ["graphical-session.target"];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  # Install System-Wide Fonts
  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = ["Hack" "CascadiaMono" "SourceCodePro"];})
  ];

  # List packages installed in system profile.
  environment = {
    systemPackages = with pkgs; [
      corefonts # Microsoft truetype fonts
      colemak-dh
      xdg-user-dirs
      cinnamon.nemo
      pavucontrol
      kitty
      polkit
      polkit_gnome # Login Promts for GUI Stuff
      nh # nix-helper, literally better nix commands
      home-manager # Home-Manager for Nix
      alejandra
      statix
      comma
      manix
      nix-du
      nix-init
      mangohud
      protonup
      vulkan-tools
      gperftools
      pkgsi686Linux.gperftools
      alsa-utils # Some Sound Utilities
      playerctl
      libnotify
      glib
      wl-clipboard
      wl-clip-persist
      cliphist
      trash-cli
      tldr
      btop
      neofetch
      fd
      ripgrep
      lsd
      bat
    ];
    sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1"; # Incase if thy cursor turns invisible on wayland
      NIXOS_OZONE_WL = "1"; # Hint electron apps to use wayland
      FLAKe = "/home/sphericalpb/.config/nix-conf"; # for nh (nix-helper)
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    };
  };

  users.users.sphericalpb = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"];
    shell = pkgs.fish;
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}
