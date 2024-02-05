{ config, pkgs, files, ... }:
{
  home.packages = with pkgs; [
    pass
    simple-http-server
    ripgrep
    mosh
    zellij
    rnix-lsp
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
  ];

  home.file = {
    ".config/zellij".source = /${files}/zellij;
  };
}
