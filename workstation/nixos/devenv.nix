
{ config, lib, pkgs, ... }:

{

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # Install some packages
  environment.systemPackages =
    with pkgs;
    [
      wget
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
      less
      man
      neovim
      coreutils
      gnuplot
      stack
    ];
    programs.zsh.promptInit = "source ${pkgs.zsh-powerlevel9k}/share/zsh-powerlevel9k/powerlevel9k.zsh-theme";

  fonts.fonts = 
  [ 
#    pkgs.cm_unicode
    pkgs.lmodern
  ];


}

