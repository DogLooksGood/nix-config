{ config, pkgs, stable, system, lib, home-manager, modules, nixos-wsl, ... }:
{
  imports =
    [
      nixos-wsl.nixosModules.wsl
      home-manager.nixosModules.home-manager
    ];

  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs = true
      keep-derivations = true
    '';
  };

  fonts.packages = with pkgs; [
    lmodern
    symbola
    lxgw-wenkai
    uni-vga
  ];

  qt.enable = true;

  # Use Fcitx5 input method
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.addons = with pkgs; [
      fcitx5-rime
      fcitx5-gtk
    ];
  };

  wsl.enable = true;
  wsl.defaultUser = "tianshu";

  networking.hostName = "tianshu-wsl"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Configure keymap in X11
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.variant = "dvp";

  # Enable zsh shell
  programs.zsh.enable = true;

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
    adw-gtk3
    home-manager
    nano
    git
    gnupg
    wget
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.ssh.startAgent = false;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  system.stateVersion = "23.11"; # Do not change
}
