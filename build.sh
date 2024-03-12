#!/bin/sh

nixos-rebuild switch --use-remote-sudo --impure --flake .
