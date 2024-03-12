{ pkgs, ... }:
{
  home.packages = with pkgs; [
    telegram-desktop
    discord
    freetube
    blackbox-terminal
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
  ];

  home.sessionVariables = {
    SDL_VIDEODRIVER = "wayland";
  };

  fonts.fontconfig.enable = true;
}
