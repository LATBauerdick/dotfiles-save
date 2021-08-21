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
  home.stateVersion = "21.11";

  home.packages =
    with pkgs;
    [
      bat
      cabal2nix
      cachix
      ctags
      envsubst
      fd
      fzf
      gawk
      hub
      imagemagick
      kitty
      librsvg
      lzop
      mdcat
      nodejs
      ormolu
      pandoc
      pv
      qrencode
      restic
      ripgrep
      silver-searcher
      stack
      tldr
      tmux
      tree
      wget
      zoxide
      htop
      fortune
      mosh
      dtach
      neovim
    # neovim-nightly
      ag
      fzf
      zlib
    #  rustc cargo
      cabal-install
      zoxide
      jq
    ];

}
