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
    sarasa-gothic
    liberation_ttf
    source-serif-pro
    source-sans-pro
    source-code-pro
    hack-font
    dm-sans
    font-awesome
    pixel-code
  ];
}
