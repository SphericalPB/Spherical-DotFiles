{pkgs, ...}: {
  services.easyeffects = {
    enable = true;
    preset = "LoudnessEqualizer";
  };
}
