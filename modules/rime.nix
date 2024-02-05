{ pkgs, files, ... }:
{
  home.packages = with pkgs; [
    librime
  ];

  home.file = {
    ".local/share/fcitx5/rime/default.yaml".source              = /${files}/rime/default.yaml;
    ".local/share/fcitx5/rime/pinyin_simp.dict.yaml".source     = /${files}/rime/pinyin_simp.dict.yaml;
    ".local/share/fcitx5/rime/pinyin_simp.schema.yaml".source   = /${files}/rime/pinyin_simp.schema.yaml;
    ".local/share/fcitx5/rime/xklbdz.schema.yaml".source        = /${files}/rime/xklbdz.schema.yaml;
    ".local/share/fcitx5/rime/xklbdz.dict.yaml".source          = /${files}/rime/xklbdz.dict.yaml;
    ".local/share/fcitx5/rime/xklbdz.extended.dict.yaml".source = /${files}/rime/xklbdz.extended.dict.yaml;
  };
}
