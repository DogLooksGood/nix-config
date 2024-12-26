{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    symbola
    unifont
    unifont_upper
    noto-fonts-monochrome-emoji
    noto-fonts-cjk-serif
    noto-fonts-cjk-sans
    noto-fonts-lgc-plus
    iosevka
    source-serif-pro
    source-sans-pro
    source-code-pro
    font-awesome
    hack-font
    jost
    cm_unicode
    overpass
    sarasa-gothic
  ];
}
