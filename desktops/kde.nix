{ config, pkgs, lib, ... }:
{
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.desktopManager.plasma6.notoPackage = pkgs.noto-fonts-lgc-plus;

  programs.gnupg.agent.pinentryPackage = lib.mkForce pkgs.pinentry-qt;

  environment.systemPackages = with pkgs; [
    kdePackages.qtwebengine
    kdePackages.qtwebview
    wezterm
  ];

  hardware.bluetooth.enable = true;

  i18n.inputMethod.fcitx5.waylandFrontend = true;
}
