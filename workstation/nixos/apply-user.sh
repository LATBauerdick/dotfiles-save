#!/bin/sh
pushd ~/.dotfiles/workstation/nixos
home-manager switch -f ./users/bauerdic/home.nix
popd
