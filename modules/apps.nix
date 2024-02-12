{ pkgs, unstable, ... }:
{
  home.packages = with pkgs; [
    telegram-desktop
    discord
    freetube
    blackbox-terminal
    unstable.firefox
    pinentry
    libreoffice-fresh
    mindustry
    vlc
    drawio
    vivaldi
    vivaldi-ffmpeg-codecs
  ];

  fonts.fontconfig.enable = true;
}