  # Gromit-MPX Fix (https://www.reddit.com/r/hyprland/comments/18kutkk)
} 
 wayland.windowManager.hyprland = {
    settings = {
      workspace = 
      [
      "special:gromit, gapsin:0, gapsout:0, on-created-empty: gromit-mpx -a"
      ];
      windowrule = 
      [
      "noblur, ^(Gromit-mpx)$"
      "opacity 1 override, 1 override, ^(Gromit-mpx)$"
      "noshadow, ^(Gromit-mpx)$"
      "nofullscreenrequest, ^(Gromit-mpx)$"
      "size 100% 100%, ^(Gromit-mpx)$"
      ];
      bind = 
      [
      "SUPERALT, G, tooglespecialworkspace, gromit"
      ", F8, exec, gromit-mpx --undo"
      "SHIFT , F8, exec, gromit-mpx --redo"
      ];
    };
  };  
}
