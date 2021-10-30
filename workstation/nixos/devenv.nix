
{ config, lib, pkgs, ... }:

{

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];
  	
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # Install some packages
  environment.systemPackages =
    with pkgs;
    [
      wget
      wireguard
      mosh
      networkmanager
      cryptsetup
      vim
      zsh
      git
      tmux
      dtach
      bind      # for nslookup  
      mosh
      syncthing
      gnumake
#      subversion
#      tree
#      bat
      less
      man
      neovim
    # neovim-nightly
#      ag
#      ripgrep
#      fzf
      coreutils
#      gnuplot
    # stack
      binutils gcc gnumake openssl pkgconfig
#      zlib
    #  rustc cargo
#      ghc
#      cabal-install
#      cabal2nix
      nix-prefetch-git
#      zoxide
#      jq
#      thefuck
    ];
    programs.zsh.promptInit = "source ${pkgs.zsh-powerlevel9k}/share/zsh-powerlevel9k/powerlevel9k.zsh-theme";

  fonts.fonts = 
  [ 
#    pkgs.cm_unicode
    pkgs.lmodern
  ];


}

