{ pkgs, ... }:
{
  programs.labwc.enable = true;

  services.displayManager.ly.enable = true;
  services.blueman.enable = true;

  environment.systemPackages = with pkgs; [
    waybar
    foot
    mako
    kanshi
    fuzzel
    wlroots
    wlr-randr
    pipewire
    numix-cursor-theme
    overskride
    brightnessctl
    alsa-utils
    blueman
    grim
    slurp
  ];

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

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
