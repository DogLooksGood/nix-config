{ config, pkgs, lib, ... }:
{
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.desktopManager.plasma6.notoPackage = pkgs.noto-fonts-lgc-plus;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.systemPackages = with pkgs; [
    kdePackages.qtwebengine
    kdePackages.qtwebview
    wezterm
  ];

  hardware.bluetooth.enable = true;

  i18n.inputMethod.fcitx5.waylandFrontend = true;
}
