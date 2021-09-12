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
      ag
      bat
      cachix
      ctags
      envsubst
      fd
      fortune
      fzf
      gawk
      git
      htop
      hub
      imagemagick
      jq
      kitty
      librsvg
      lzop
      mdcat
      mosh
      neovim
    # neovim-nightly
      nodejs
      pandoc
      pv
      qrencode
      restic
      ripgrep
      silver-searcher
      tldr
      tmux
      yabai
      skhd
      dtach
      tree
      wget
      zoxide
      fzf
      zoxide
    # language support
      cabal2nix
      ormolu
      zlib
    #  rustc cargo
    #  stack
    #  cabal-install
    ];

}
