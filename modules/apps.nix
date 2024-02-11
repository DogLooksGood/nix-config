{ pkgs, ... }:
{
  home.packages = with pkgs; [
    telegram-desktop
    discord
    freetube
    blackbox-terminal
    firefox
    google-chrome
    pinentry
    libreoffice-fresh
    mindustry
    vlc
  ];

  fonts.fontconfig.enable = true;
}
