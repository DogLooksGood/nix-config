{ config, home-manager, pkgs, ... }:
{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.tianshu = {
    home.username = "tianshu";
    home.homeDirectory = "/home/tianshu";

    home.packages = with pkgs; [
      fastfetch
      telegram-desktop
      emacs-igc-pgtk
      emacs-lsp-booster
      ripgrep
      brave
      slack
      discord
    ];

    home.sessionVariables = {
      EDITOR = "emacs";
      HTTPS_PROXY = "http://127.0.0.1:2080";
    };

    home.pointerCursor = {
      name = "phinger-cursors-light";
      package = pkgs.phinger-cursors;
      size = 32;
      gtk.enable = true;
    };

    programs.git = {
      enable = true;
      userName = "DogLooksGood";
      userEmail = "doglooksgood@gmail.com";
    };

    programs = {
      direnv = {
        enable = true;
        enableBashIntegration = true; # see note on other shells below
        nix-direnv.enable = true;
      };

      bash.enable = true; # see note on other shells below
    };

    home.file = {
      ".config/kanshi" = { source = ./dotfiles/kanshi; };
      ".config/zellij" = { source = ./dotfiles/zellij; };
      ".config/containers" = { source = ./dotfiles/containers; };
      ".config/sway" = { source = ./dotfiles/sway; };
      ".config/waybar" = { source = ./dotfiles/waybar; };
      ".config/foot" = { source = ./dotfiles/foot; };
      ".config/fuzzel" = { source = ./dotfiles/fuzzel; };
    };

    services.kanshi.enable = true;

    home.stateVersion = "25.05";
  };
}
