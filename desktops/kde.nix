{ config, pkgs, lib, ... }:
{
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma6.enable = true;

  services.xserver.desktopManager.plasma6.notoPackage = pkgs.noto-fonts-lgc-plus;

  environment.systemPackages = with pkgs; [
    kdePackages.qtwebengine
    kdePackages.qtwebview
  ];

  hardware.bluetooth.enable = true;

  i18n.inputMethod.fcitx5.waylandFrontend = true;
}
