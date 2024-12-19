{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pkgs.vanilla-dmz
  ];

  home.file.".icons/default".source = "${pkgs.vanilla-dmz}/share/icons/Vanilla-DMZ";
}
