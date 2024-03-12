{ pkgs, root, ... }:
{
  home.packages = with pkgs; [
    librime
  ];

  home.file = {
    ".local/share/fcitx5/rime/default.yaml".source = /${root}/files/rime/default.yaml;
    ".local/share/fcitx5/rime/pinyin_simp.dict.yaml".source = /${root}/files/rime/pinyin_simp.dict.yaml;
    ".local/share/fcitx5/rime/pinyin_simp.schema.yaml".source = /${root}/files/rime/pinyin_simp.schema.yaml;
    ".local/share/fcitx5/rime/xklbdz.schema.yaml".source = /${root}/files/rime/xklbdz.schema.yaml;
    ".local/share/fcitx5/rime/xklbdz.dict.yaml".source = /${root}/files/rime/xklbdz.dict.yaml;
    ".local/share/fcitx5/rime/xklbdz.extended.dict.yaml".source = /${root}/files/rime/xklbdz.extended.dict.yaml;
  };
}
