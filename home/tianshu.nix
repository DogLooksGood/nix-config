{ config, home-manager, pkgs, ... }:
{
  home-manager.useUserPackages = true;
  home-manager.users.tianshu = {
    home.username = "tianshu";
    home.homeDirectory = "/home/tianshu";

    home.packages = with pkgs; [
      acpi
      blender
      bluetui
      brave
      chromium
      cmake
      emacs-igc-pgtk
      fastfetch
      ffmpeg
      file
      firefox
      foot
      fuzzel
      gcc
      gdb
      gh
      git
      global
      gnumake
      grim
      guile
      guile.info
      guile.dev
      hidapi
      inetutils
      inkscape
      iw
      killall
      libnotify
      libresprite
      libwebp
      lshw
      mako
      man-pages
      man-pages-posix
      mg
      mpv
      mypaint
      obs-studio
      pass
      pciutils
      pinfo
      pkg-config
      ripgrep
      simple-http-server
      slack
      slurp
      solana-cli
      telegram-desktop
      tmux
      tokei
      tree
      undetected-chromedriver
      unzip
      wineWowPackages.waylandFull
      usb-modeswitch
      usb-modeswitch-data
      usbutils
      weechat
      wev
      wget
      wl-clipboard
      wlr-randr
      wtype
      yt-dlp
      zip
      zip
      swww
      swappy
    ];

    home.sessionVariables = {
      EDITOR = "emacs";
      ALL_PROXY="http://127.0.0.1:2080";
      HTTPS_PROXY="http://127.0.0.1:2080";
      use_proxy="on"; # for wget
      https_proxy="http://127.0.0.1:2080";
    };

    home.pointerCursor = {
      name = "XCursor-Pro-Red";
      package = pkgs.xcursor-pro;
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
      ".direnvrc" = { source = ../dotfiles/direnv/.direnvrc; };
    };

    services.kanshi.enable = true;

    home.stateVersion = "25.05";
  };
}
