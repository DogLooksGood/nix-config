switch: home-manager nixos

nixos:
    nixos-rebuild switch --impure --use-remote-sudo --flake .

home-manager:
    home-manager switch --flake . -b backup
