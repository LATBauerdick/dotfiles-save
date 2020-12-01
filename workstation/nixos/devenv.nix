
{ config, lib, pkgs, ... }:

{

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # Install some packages
  environment.systemPackages =
    with pkgs;
    [
      wget
      networkmanager
      cryptsetup
      vim
      zsh
      git
      tmux
      bind      # for nslookup  
      mosh
      syncthing
      gnumake
      subversion
      tree
      bat
      less
      man
      neovim
      ag
      ripgrep
      fzf
      coreutils
      gnuplot
      stack
      binutils gcc gnumake openssl pkgconfig
    #  rustc cargo   
    ];
    programs.zsh.promptInit = "source ${pkgs.zsh-powerlevel9k}/share/zsh-powerlevel9k/powerlevel9k.zsh-theme";

  fonts.fonts = 
  [ 
#    pkgs.cm_unicode
    pkgs.lmodern
  ];


}

