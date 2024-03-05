#!/bin/sh

set -e

TARGET=$1

case "$TARGET" in
    all|a)
        nixos-rebuild switch --use-remote-sudo --impure --flake .
        home-manager switch --flake . -b backup
        ;;
    nixos|n)
        nixos-rebuild switch --use-remote-sudo --impure --flake .
        ;;
    home-manager|h)
        home-manager switch --flake . -b backup
        ;;
esac
