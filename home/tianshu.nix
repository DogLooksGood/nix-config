{ config, home-manager, pkgs, ... }:
{
  home-manager.useUserPackages = true;
  home-manager.users.tianshu = {
    home.username = "tianshu";
    home.homeDirectory = "/home/tianshu";

    home.packages = with pkgs; [
      alt-ergo
      blender
      cvc4
      drawio
      hidapi
      httrack
      inkscape
      obs-studio
      why3
      yt-dlp
      schemesh
    ];

    home.sessionVariables = {
      EDITOR = "emacsclient";
      ALL_PROXY = "http://127.0.0.1:2080";
      HTTPS_PROXY = "http://127.0.0.1:2080";
      NO_PROXY = "localhost,127.0.0.1,::1,.local,.lan,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16";
      use_proxy = "on"; # for wget
      https_proxy = "http://127.0.0.1:2080";
    };

    gtk = {
      enable = true;
      iconTheme = {
        name = "Tango";
        package = pkgs.tango;
      };
    };

    home.pointerCursor = {
      name = "XCursor-Pro-Light";
      package = pkgs.xcursor-pro;
      size = 32;
      gtk.enable = true;
    };

    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "DogLooksGood";
          email = "doglooksgood@gmail.com";
        };
        core = {
          excludesFile = "~/.gitignore_global";
        };
      };
    };

    programs = {
      direnv = {
        enable = true;
        enableBashIntegration = true; # see note on other shells below
        nix-direnv.enable = true;
      };

      bash = {
        enable = true;
        bashrcExtra = ''
          PROMPT_COMMAND=__bash_prompt
          source ${../dotfiles/bash/prompt.sh}
          source ${../dotfiles/bash/osc7_cwd.sh}
        '';
      };
    };

    programs.firefox.enable = true;

    home.file = {
      ".config/zellij" = { source = ../dotfiles/zellij; };
      ".config/containers" = { source = ../dotfiles/containers; };
      ".config/sway" = { source = ../dotfiles/sway; };
      ".config/waybar" = { source = ../dotfiles/waybar; };
      ".config/foot" = { source = ../dotfiles/foot; };
      ".config/fuzzel" = { source = ../dotfiles/fuzzel; };
      ".config/labwc" = { source = ../dotfiles/labwc; };
      ".tmux.conf" = { source = ../dotfiles/tmux/.tmux.conf; };
      ".guile" = { source = ../dotfiles/guile/.guile; };
    };

    services.kanshi.enable = true;

    home.stateVersion = "25.05";
  };
}
