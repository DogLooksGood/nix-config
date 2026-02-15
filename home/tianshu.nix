{ config, home-manager, pkgs, ... }:
{
  home-manager.useUserPackages = true;
  home-manager.users.tianshu = {
    home.username = "tianshu";
    home.homeDirectory = "/home/tianshu";

    home.packages = with pkgs; [
      acpi
      aria2
      autoconf
      automake
      blender
      bluetui
      cmake
      drawio
      emacs-pgtk
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
      gnum4
      gnumake
      grim
      guile
      guile.info
      guile.dev
      hidapi
      hmcl
      inetutils
      inkscape
      iw
      killall
      libnotify
      libresprite
      libtool
      libwebp
      lshw
      mako
      man-pages
      man-pages-posix
      mg
      mpv
      obs-studio
      pass
      pciutils
      lxqt.pcmanfm-qt
      pinfo
      pkg-config
      qemacs
      ripgrep
      shared-mime-info
      sigil
      simple-http-server
      slurp
      solana-cli
      sqlite
      tango-icon-theme
      telegram-desktop
      texliveMedium
      tmux
      tokei
      tree
      unzip
      usb-modeswitch
      usb-modeswitch-data
      usbutils
      valgrind
      waybar
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

    gtk = {
      enable = true;
      iconTheme = {
        name = "Tango"; # The internal name of the theme
        package = pkgs.tango; # The Nix package containing it
      };
    };

    home.pointerCursor = {
      name = "XCursor-Pro-Red";
      package = pkgs.xcursor-pro;
      size = 32;
      gtk.enable = true;
    };

    programs.git = {
      enable = true;
      settings.user = {
        name = "DogLooksGood";
        email = "doglooksgood@gmail.com";
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
