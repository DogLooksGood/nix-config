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
    goldendict-ng
    blender
    tiled
  ];

  fonts.fontconfig.enable = true;
}
