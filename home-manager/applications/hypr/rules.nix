{
  wayland.windowManager.hyprland = {
    settings = {
      # Window Rules
      # [https://wiki.hyprland.org/Configuring/Window-Rules]
      windowrule = [
        "pin, title:(Picture in picture)"

        "float, title:(Bitwarden -)(.*)$"
        "pin, title:(Bitwarden -)(.*)$"
        "move 62% 50%, title:(Bitwarden -)(.*)$"
      ];
      windowrulev2 = [
      ];
      # Workspace Rules
      # [https://wiki.hyprland.org/Configuring/Workspace-Rules]
      workspace = [
      ];
    };
    extraConfig = ''
      # Gromit-MPX Fix
      # [https://www.reddit.com/r/hyprland/comments/18kutkk]
      workspace = special:gromit, gapsin:0, gapsout:0, on-created-empty: gromit-mpx -a
      windowrule = noblur, ^(Gromit-mpx)$
      windowrule = opacity 1 override, 1 override, ^(Gromit-mpx)$
      windowrule = noshadow, ^(Gromit-mpx)$
      windowrule = suppressevent, fullscreen, ^(Gromit-mpx)$
      windowrule = size 100% 100%, ^(Gromit-mpx)$
    '';
  };
}
