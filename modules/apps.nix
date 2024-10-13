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
    libresprite
    libwacom
    qbittorrent
    xournalpp
    mindustry
    protonplus
    blackbox-terminal
    ytdownloader
    ldtk
    goldendict-ng
    floorp
  ];

  home.sessionVariables = {
    SDL_VIDEODRIVER = "wayland";
  };

  fonts.fontconfig.enable = true;
}
