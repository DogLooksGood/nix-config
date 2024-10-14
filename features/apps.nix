{ pkgs, stable, ... }:
{
  home.packages = with pkgs; [
    xray
    telegram-desktop
    discord
    freetube
    rnote
    pinentry
    libreoffice-fresh
    vlc
    drawio
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
  ];

  fonts.fontconfig.enable = true;
}
