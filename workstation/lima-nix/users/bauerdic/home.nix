{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "bauerdic";
  home.homeDirectory = "/home/bauerdic";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  #####LATB???? home.stateVersion = "21.05";


#  programs.gpg = {
#    enable = true;
#  };

#  services.gpg-agent = {
#    enable = true;
#    pinentryFlavor = "qt";
#  };

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
      sha256 = "04d51s52nddf1669wdvacvm952f7f3m8dpddx4ndnvp9bvdn0nzs";
    }))
  ];

  home.packages = with pkgs; [
      bat
      ctags
      fd
      fzf
      dtach
      gawk
      gcc
      git
      git-crypt
      gnupg
      gnumake
      pinentry-qt
      htop
#      hub
#      imagemagick
      jq
      kitty
#      librsvg
#      lzop
#      mdcat
      neovim
#      nodejs
      pandoc
#      pv
#      qrencode
#      restic
      ripgrep
      silver-searcher
#      tldr
      texlive.combined.scheme-full
      tmux
#      thefuck
      tree
      wget
      zoxide

# language support
      cabal-install
      cabal2nix
  ];
#    programs.zsh.promptInit = "source ${pkgs.zsh-powerlevel9k}/share/zsh-powerlevel9k/powerlevel9k.zsh-theme";
}
