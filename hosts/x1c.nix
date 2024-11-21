{ pkgs, inputs, system, root, ... }:
{
  imports =
    [
      /${root}/hardware-configurations/x1c.nix

      # Android simulator
      # /${root}/modules/waydroid.nix

      /${root}/modules/font.nix
    ];

  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs = true
      keep-derivations = true
    '';
  };

  qt.enable = true;

  hardware = {
    graphics.enable = true;
    graphics.extraPackages = with pkgs; [ vpl-gpu-rt ];
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "tianshu-laptop"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://localhost:20171";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  services.fprintd.enable = true;

  services.v2raya.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.variant = "dvp";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  console.useXkbConfig = true;

  powerManagement = {
    enable = true;
    powertop.enable = true;
    cpuFreqGovernor = "powersave";
  };

  services = {
    thermald.enable = true;
    power-profiles-daemon.enable = false;
    auto-cpufreq = {
      enable = true;
      settings = {
        battery = {
          governor = "powersave";
          turbo = "never";
        };
        charger = {
          governor = "powersave";
          turbo = "auto";
        };
      };
    };
  };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # hardware.pulseaudio.enable = true;

  # Enable bluetooth
  hardware.bluetooth.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  programs.zsh.enable = true;

  # Enable zsh shell
  # programs.xonsh = {
  #   enable = true;
  #   config = ''
  #   aliases['zj'] = 'zellij --layout $HOME/.config/zellij/layout.kdl'
  #   aliases['pr'] = "podman run -it --rm --detach-keys 'ctrl-d'"
  #   '';
  #   package = pkgs.xonsh.override { extraPackages = ps: [ ps.xontrib-prompt-bar ]; };
  # };

  # No password for sudo
  security.sudo.wheelNeedsPassword = false;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tianshu = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    mg
    adw-gtk3
    home-manager
    yubikey-personalization
    git
    gnupg
    wget
    firefox
    vulkan-tools
    neofetch
    inputs.zen-browser.packages."${system}".specific
  ];

  # Enable flatpack
  # Usages:
  # flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  # flatpak update
  # flatpak search xxx
  # flatpak install xxx
  # flatpak run xxx
  services.flatpak.enable = true;

  # environment.shellInit = ''
  #   gpg-connect-agent /bye
  #   export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
  # '';

  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  # virtualisation.virtualbox.host.enable = true;
  # users.extraGroups.vboxusers.members = [ "tianshu" ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.ssh.startAgent = false;

  # programs.steam = {
  #   enable = true;
  #   remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  #   dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  #   localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  # };

  # Smart card
  services.pcscd.enable = true;

  # For Yubico
  services.udev.packages = [ pkgs.yubikey-personalization ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  system.stateVersion = "23.11"; # Do not change
}
