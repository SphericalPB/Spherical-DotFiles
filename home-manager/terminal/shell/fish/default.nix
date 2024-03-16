{
  config,
  pkgs,
  ...
}: let
  # Good lord... what a mess.
  # but hey atleast it works!
  # probably too well, somehow...
  nix-rebuild = "alejandra ~/.config/nix-conf; sudo nix-rebuild switch --flake ~/.config/nix-conf/#sphericalpb@Spherical-NixOS; cd ~/.config/nix-conf; git commit -a -m $(date -u +%Y-%m-%d_%H:%M:%S); cd -";
  hm-rebuild = "alejandra ~/.config/nix-conf; home-manager switch --flake ~/.config/nix-conf/#sphericalpb@Spherical-NixOS; cd ~/.config/nix-conf; git commit -a -m $(date -u +%Y-%m-%d_%H:%M:%S); cd -";
in {
  programs = {
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
    nix-index = {
      enable = true;
      enableFishIntegration = true;
    };
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disables greeting
    '';
    shellAliases = {
      rebuild-switch = "${nix-rebuild}";
      hm-switch = "${hm-rebuild}";
      ls = "lsd";
      rm = "trash";
      rm-list = "trash-list";
    };

    plugins = [
      # Enable a plugin (here grc for colorized command output) from nixpkgs
      {
        name = "tide";
        src = pkgs.fishPlugins.tide.src;
      }

      {
        name = "catppuccin-fish";
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "fish";
          rev = "0ce27b518e8ead555dec34dd8be3df5bd75cff8e";
          sha256 = "Dc/zdxfzAUM5NX8PxzfljRbYvO9f9syuLO8yBr+R3qg=";
        };
      }

      {
        name = "sponge";
        src = pkgs.fetchFromGitHub {
          owner = "meaningful-ooo";
          repo = "sponge";
          rev = "384299545104d5256648cee9d8b117aaa9a6d7be";
          sha256 = "MdcZUDRtNJdiyo2l9o5ma7nAX84xEJbGFhAVhK+Zm1w=";
        };
      }

      {
        name = "done";
        src = pkgs.fetchFromGitHub {
          owner = "franciscolourenco";
          repo = "done";
          rev = "d47f4d6551cccb0e46edfb14213ca0097ee22f9a";
          sha256 = "VSCYsGjNPSFIZSdLrkc7TU7qyPVm8UupOoav5UqXPMk=";
        };
      }
    ];
  };
}
