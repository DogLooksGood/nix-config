{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nil
    gnumake
    gcc14
    pkg-config
    universal-ctags
    wlrctl
    man-pages
    glslviewer
  ];
}
