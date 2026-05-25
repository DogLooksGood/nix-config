{ config, home-manager, pkgs, ... }:
{
  home-manager.useUserPackages = true;
  home-manager.users.amal = {
    home.username = "amal";
    home.homeDirectory = "/home/amal";

    home.packages = with pkgs; [
      drawio
      git
      slack
      typst
    ];

    home.sessionVariables = {
      EDITOR = "emacsclient";
      use_proxy = "on"; # for wget
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

    programs = {
      direnv = {
        enable = true;
        enableBashIntegration = true; # see note on other shells below
        nix-direnv.enable = true;
      };

      bash = {
        enable = true;
        bashrcExtra = ''
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
