{ pkgs, ... }:
{
  programs.alacritty = {
    enable = true;

    settings = {
      import = [
        "${pkgs.alacritty-theme}/github_light.toml"
      ];
      font = {
        normal = {
          family = "JuliaMono";
          style = "Regular";
        };
        size = 10.0;
      };
    };
  };
}
