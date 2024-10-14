{ pkgs, ... }:
{
  home.packages = with pkgs; [
    emacs-pgtk
    emacs-lsp-booster
  ];

  home.sessionVariables = {
    EMACS_MODULE_HEADER = "${pkgs.emacs-pgtk}/include/emacs-module.h";
  };
}
