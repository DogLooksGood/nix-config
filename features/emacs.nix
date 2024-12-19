{ pkgs, ... }:
{
  home.packages = with pkgs; [
    emacs30-pgtk
    emacs-lsp-booster
    tdlib
    typescript-language-server
    clojure-lsp
    rust-analyzer
    copilot-node-server
    nil
  ];

  home.sessionVariables = {
    EMACS_MODULE_HEADER = "${pkgs.emacs30-pgtk}/include/emacs-module.h";
    TDLIB_PREFIX = "${pkgs.tdlib}";
  };
}
