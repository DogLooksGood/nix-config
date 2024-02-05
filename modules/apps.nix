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
  ];

  fonts.fontconfig.enable = true;
}
