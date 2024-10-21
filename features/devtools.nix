{ pkgs, ... }:
{
  home.packages = with pkgs; [
    rust-analyzer
    clojure-lsp
    nil
    gnumake
    gcc
  ];
}
