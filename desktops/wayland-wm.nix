{ pkgs, ... }:
{
  services.displayManager.ly.enable = true;
  services.blueman.enable = true;

  environment.systemPackages = with pkgs; [
    foot
    mako
    kanshi
    fuzzel
    wlroots
    wlr-randr
    pipewire
    overskride
    brightnessctl
    alsa-utils
    blueman
    grim
    slurp
  ];

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    GOLDENDICT_FORCE_WAYLAND = "1";
    XKB_DEFAULT_OPTIONS = "caps:ctrl_modifier";
    XKB_DEFAULT_LAYOUT = "us";
    XKB_DEFAULT_VARIANT = "dvp";
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
