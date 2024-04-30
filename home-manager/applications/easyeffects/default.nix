{pkgs, ...}: {
  xdg.configFile."easyeffects/output".source = ./presets;

  services.easyeffects = {
    enable = true;
    preset = "Perfect EQ";
  };
}
