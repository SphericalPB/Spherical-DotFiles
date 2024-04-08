{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    pyprland
  ];

  wayland.windowManager.hyprland = {
    settings = {
      exec-once = ["pypr"];
      bind = [
        "$mod,A,exec,pypr toggle term"
        "CTRL SHIFT, F, exec, pypr toggle lf"
        "$modAlt,T,exec,pypr toggle btop"
        "$modAlt,V,exec,pypr toggle volume"
      ];
    };
  };

  home.file.".config/hypr/pyprland.toml".text = ''
    [pyprland]
    plugins = ["scratchpads"]

    [scratchpads.term]
    animation = "fromTop"
    command = "kitty --class kitty-dropterm"
    class = "kitty-dropterm"
    size = "70% 60%"
    max_size = "1366px 100%"
    margin = 15
    excludes = ["lf"]

    [scratchpads.lf]
    animation = "fromTop"
    command = "kitty --class kitty-lf lf"
    class = "kitty-lf"
    size = "70% 55%"
    max_size = "1366px 100%"
    margin = 15
    excludes = ["term"]

    [scratchpads.btop]
    animation = "fromBottom"
    command = "kitty --class kitty-btop btop"
    class = "kitty-btop"
    size = "60% 55%"
    margin = 20
    lazy = true

    [scratchpads.volume]
    animation = "fromright"
    command = "pavucontrol"
    class = "pavucontrol"
    size = "40% 85%"
    margin = 20
    unfocus = "hide"
    hysteresis = 1
    lazy = true
  '';
}
