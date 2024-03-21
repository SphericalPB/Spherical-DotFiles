{
  wayland.windowManager.hyprland = {
    settings = {
      windowrule = [
        ""
      ];
      windowrulev2 = [
        "float, title:(.*)(- Bitwarden)$"
        "pin, title:(.*)(- Bitwarden)$"
      ];
    };
  };
}
