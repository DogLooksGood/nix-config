{ pkgs, ... }:
{
  home.packages = with pkgs; [
    xray
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
    ytdownloader
    ldtk
    slack
    thunderbird
    fontforge-gtk
    nix-index
    obs-studio
  ];

  fonts.fontconfig.enable = true;
}
