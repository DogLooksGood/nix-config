{ pkgs, ... }:
{
  home.packages = with pkgs; [
    emacs-pgtk
    emacs-lsp-booster
  ];
}
