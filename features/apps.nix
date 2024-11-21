{ pkgs, ... }:
{
  home.packages = with pkgs; [
    xray
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
    slack
    thunderbird
    zoom-us
    dino
    kando
    fontforge-gtk
  ];

  fonts.fontconfig.enable = true;
}
