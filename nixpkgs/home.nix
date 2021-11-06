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
  home.stateVersion = "21.05";

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];

home.packages = with pkgs; [
      bat
      cachix
      dtach
      fd
      fzf
      gawk
      git
      git-crypt
      gnupg
      htop
      imagemagick
      jq
#      lima
      mosh
#  programs.neovim = {
#    enable = true;
#    package = pkgs.neovim-nightly;
      neovim
      pandoc
      ripgrep
      silver-searcher
      tmux
      tree
      wget
      zoxide
# language support
      cabal2nix
      cabal-install

#      ctags
#      envsubst
#      hub
#      kitty
#      librsvg
#      lzop
#      mdcat
#      nodejs
#      pv
#      qrencode
#      restic
#      tldr
#      yabai
#      skhd
#      thefuck
    ];

}
