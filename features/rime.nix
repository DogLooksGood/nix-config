{ config, lib, pkgs, root, ... }:
let
  schemaSrc = pkgs.fetchzip {
    url = "https://github.com/sbsrf/sbsrf/releases/download/20240915/sbsrf.zip";
    hash = "sha256-YjYUB5LNpzXCtU9cX4pDp5mJ+0Pd17r98LslaK2E4y4=";
    stripRoot = false;
  };

  targetDir = ".local/share/fcitx5/rime";

  srcFiles = builtins.readDir schemaSrc;
in
{
  home.packages = with pkgs; [
    librime
    librime-lua
  ];

  home.file = builtins.listToAttrs
    (lib.attrsets.mapAttrsToList
      (file: type:
        {
          name = "${targetDir}/${file}";
          value = { source = "${schemaSrc}/${file}"; };
        }
      )
      srcFiles);

  home.sessionVariables = {
    LIBRIME_ROOT = "${pkgs.librime}/";
  };
}
