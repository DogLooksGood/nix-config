{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    rust-analyzer
    clojure-lsp
    nixd
    gnumake
    gcc
  ];
}
