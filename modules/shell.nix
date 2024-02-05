{ config, pkgs, files, ... }:
{
  home.packages = with pkgs; [
    pass
    simple-http-server
    ripgrep
    mosh
    zellij
    babashka
    curl
    unzip
    wget
    tree
    yarn
    tokei
    zip
    jet
    p7zip
    qrencode
    gnumake
    httpie
    usbutils
    android-tools
    htop
    git
  ];

  home.file = {
    ".config/zellij".source = /${files}/zellij;
  };

  programs.git = {
    enable = true;
    userEmail = "doglooksgood@gmail.com";
    userName = "DogLooksGood";
  };
}
