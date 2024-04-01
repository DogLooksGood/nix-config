{ pkgs, ... }:
{
  home.packages = with pkgs; [
    emacs-pgtk
  ];
}
