{ pkgs, ... }:
{
  programs.labwc.enable = true;

  services.displayManager.ly.enable = true;

  environment.systemPackages = with pkgs; [
    waybar
    foot
  ];

  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "dvp";
    };
  };

  # Use Fcitx5 input method
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.waylandFrontend = true;
    fcitx5.addons = with pkgs; [
      fcitx5-rime
      fcitx5-gtk
      libsForQt5.fcitx5-qt
    ];
  };

}
