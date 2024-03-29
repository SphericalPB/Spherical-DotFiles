{config, ...}: {
  programs.eww = {
    configDir = "~/.config/eww/eww-notif";
  };

  home.file.".config/eww/eww-notif/eww.yuck".text = ''
    (defwindow notifications
               :monitor 0
        :geometry (geometry :x "20px"
                            :y "20px"
    		 :anchor "bottom right")
        :stacking "overlay" # "fg" for X11 / "overlay" for Wayland
        (label :text "SEGGS"))

  '';
}
