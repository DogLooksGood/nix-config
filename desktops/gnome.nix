{ config, pkgs, lib, ... }:
{
  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-connections
    epiphany
    geary
  ];

  security.pam.services.login.fprintAuth = false;
  # similarly to how other distributions handle the fingerprinting login
  security.pam.services.gdm-fingerprint = lib.mkIf (config.services.fprintd.enable) {
    text = ''
      auth       required                    pam_shells.so
      auth       requisite                   pam_nologin.so
      auth       requisite                   pam_faillock.so      preauth
      auth       required                    ${pkgs.fprintd}/lib/security/pam_fprintd.so
      auth       optional                    pam_permit.so
      auth       required                    pam_env.so
      auth       [success=ok default=1]      ${pkgs.gdm}/lib/security/pam_gdm.so
      auth       optional                    ${pkgs.gnome-keyring}/lib/security/pam_gnome_keyring.so

      account    include                     login

      password   required                    pam_deny.so

      session    include                     login
      session    optional                    ${pkgs.gnome-keyring}/lib/security/pam_gnome_keyring.so auto_start
    '';
  };

  qt = {
    platformTheme = "gnome";
    style = "adwaita-dark";
  };

  environment.systemPackages = with pkgs; [
    dconf-editor
    gnomeExtensions.kimpanel
    gnomeExtensions.legacy-gtk3-theme-scheme-auto-switcher
    gnomeExtensions.wiggle
    gnome-tweaks
    qadwaitadecorations-qt6
    gnomeExtensions.kando-integration
  ];

  environment.shellInit = ''
    export QT_WAYLAND_DECORATION=adwaita
  '';

  services.gnome.gnome-keyring.enable = lib.mkForce false;

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
