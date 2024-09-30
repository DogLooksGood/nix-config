{ pkgs, stable, ... }:
{
  home.packages = with pkgs; [
    xray
    telegram-desktop
    discord
    freetube
    firefox
    rnote
    pinentry
    libreoffice-fresh
    vlc
    drawio
    vivaldi
    vivaldi-ffmpeg-codecs
    inkscape
    chromium
    godot_4
    libresprite
    libwacom
    scrcpy
    qbittorrent
    xournalpp
    mindustry
    protonplus
    blackbox-terminal
    ytdownloader
  ];

  home.sessionVariables = {
    SDL_VIDEODRIVER = "wayland";
  };

  fonts.fontconfig.enable = true;
}
