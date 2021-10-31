{ config, lib, pkgs, ... }:

let sources = import ../../niv/sources.nix;
in {
  xdg.enable = true;

  #---------------------------------------------------------------------
  # Packages
  #---------------------------------------------------------------------


  # Packages I always want installed. Most packages I install using
  # per-project flakes sourced with direnv and nix-shell, so this is
  # not a huge list.
  home.packages = [
    pkgs.fzf
    pkgs.htop
    pkgs.jq
    pkgs.tree
    pkgs.silver-searcher
    pkgs.zoxide
    pkgs.neovim
#    ( let
#        neuronPkg = import (
#          builtins.fetchTarball {
#            url = "https://github.com/srid/neuron/archive/10e3ea028c23e664e540d0460e9515bdf02ac51d.tar.gz";
#            sha256 = "039a9vgjwal0lb5zz0ilk1vlmhs1yc6vp17j5nnkl639vj5f0yxl";
#          }
#        ) {};
#      in neuronPkg.default
#    )
#    pkgs.ghc
#    pkgs.neuron
#    pkgs.kitty

    pkgs.git-crypt
#    pkgs.gopls
#    pkgs.rofi
#    pkgs.watch

#    pkgs.tlaplusToolbox
#    pkgs.tetex
  ];

  #---------------------------------------------------------------------
  # Env vars and dotfiles
  #---------------------------------------------------------------------

  home.sessionVariables = {
    LANG = "en_US.UTF-8";
    LC_CTYPE = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    EDITOR = "nvim";
    PAGER = "less -FirSwX";
    MANPAGER = "less -FirSwX";
  };

  #---------------------------------------------------------------------
  # Programs
  #---------------------------------------------------------------------

}
