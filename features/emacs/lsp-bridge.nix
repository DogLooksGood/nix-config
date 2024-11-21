{ pkgs, ... }:
let
  python = pkgs.python3.withPackages (p:
    with p; [
      epc
      orjson
      paramiko
      rapidfuzz
      setuptools
      sexpdata
      six
      watchdog
    ]);
in pkgs.runCommand "python-for-lsp-bridge" { } ''
  mkdir -p $out/bin
  ln -s ${python}/bin/python $out/bin/python-for-lsp-bridge
''
