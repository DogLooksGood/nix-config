{ pkgs, ... }:
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
    ungoogled-chromium
    godot_4
    libresprite
    libwacom
    scrcpy
    qbittorrent
    xournalpp
  ];

  home.sessionVariables = {
    SDL_VIDEODRIVER = "wayland";
  };

  fonts.fontconfig.enable = true;
}
