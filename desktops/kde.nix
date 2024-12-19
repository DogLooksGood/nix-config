{ pkgs, ... }:
{
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.desktopManager.plasma6.notoPackage = pkgs.noto-fonts-lgc-plus;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.plasma5.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    konsole
    elisa
    oxygen
    kate
    khelpcenter
    baloo-widgets
  ];

  environment.systemPackages = with pkgs; [
    kdePackages.qtwebengine
    kdePackages.qtwebview
    kdePackages.fcitx5-qt

    foot
  ];

  # Use Fcitx5 input method
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.addons = with pkgs; [
      fcitx5-rime
      fcitx5-gtk
      libsForQt5.fcitx5-qt
    ];
  };
}
