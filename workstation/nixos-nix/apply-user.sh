#!/bin/sh
pushd ~/.dotfiles/workstation/nixos
# home-manager switch -f ./users/bauerdic/home.nix
nix build .#homeManagerConfigurations.bauerdic.activationPackage
./result/activate
popd
