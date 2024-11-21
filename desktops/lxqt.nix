{ pkgs, ... }:
{
  services.displayManager.ly.enable = true;

  services.xserver.desktopManager.lxqt.enable = true;

  hardware.bluetooth.enable = true;

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
