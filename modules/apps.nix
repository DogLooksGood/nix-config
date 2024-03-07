{ pkgs, unstable, ... }:
{
  home.packages = with pkgs; [
    telegram-desktop
    discord
    unstable.freetube
    blackbox-terminal
    unstable.firefox
    unstable.rnote
    pinentry
    libreoffice-fresh
    mindustry
    vlc
    drawio
    vivaldi
    vivaldi-ffmpeg-codecs
    inkscape
    ungoogled-chromium
    godot_4
    libresprite
    libwacom
  ];

  fonts.fontconfig.enable = true;
}
