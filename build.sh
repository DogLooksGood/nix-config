#!/bin/sh

nixos-rebuild switch --accept-flake-config --use-remote-sudo --flake .
