{
  wayland.windowManager.hyprland = {
    settings = {
      # Window Rules
      # [https://wiki.hyprland.org/Configuring/Window-Rules]
      windowrule = [
        "pin, title:(Picture in picture)"
        "float, initialtitle:(Bitwarden -)(.*),title:(Bitwarden -)(.*)$"
        "pin, initialtitle:(Bitwarden -)(.*),title:(Bitwarden -)(.*)$"
        "move 61% 10%, initialtitle:(Bitwarden -)(.*),title:(Bitwarden -)(.*)$"
      ];
      windowrulev2 = [
      ];
      # workspace rules
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
