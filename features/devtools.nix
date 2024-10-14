{ pkgs, ... }:
{
  home.packages = with pkgs; [
    rust-analyzer
    clojure-lsp
    gnumake
    gcc
  ];
}
