#!/usr/bin/env bash

nix flake update
sudo darwin-rebuild switch --flake /Users/justin/src/Ungyo-Nix/.#