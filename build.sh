#!/bin/sh

nixos-rebuild switch --use-remote-sudo --show-trace --flake .
