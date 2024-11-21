{ lib, pkgs, root, ... }:
let
  quick5Src = builtins.fetchGit {
    url = "git@github.com:DogLooksGood/rime-quick.git";
    ref = "master";
    rev = "d3478d63c3c0c3385a1b4d1ecb0f55584574d2bb";
  };

  targetDir = ".config/rime";

  processFiles = dir:
    let
      src = builtins.readDir dir;

      allFiles = lib.attrsets.mapAttrsToList
        (file: type:
          {
            name = "${targetDir}/${file}";
            value = { source = "${dir}/${file}"; };
          })
        src;

      yamlOnly = builtins.filter
        (x: lib.strings.hasSuffix ".yaml" x.name)
        allFiles;

    in
      builtins.listToAttrs yamlOnly;
in
{
  home.packages = with pkgs; [
    librime
    librime-lua
    rime-data
  ];

  home.file =
    processFiles "${pkgs.rime-data}/share/rime-data"
    //
    processFiles quick5Src
    //
    {
      "${targetDir}/default.custom.yaml".source = /${root}/files/rime/default.custom.yaml;
    };

  home.sessionVariables = {
    LIBRIME_ROOT = "${pkgs.librime}/";
  };
}
