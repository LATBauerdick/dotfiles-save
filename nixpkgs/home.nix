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

  home.packages = with pkgs; [
      bat
      cachix
#      ctags
#      envsubst
      dtach
      fd
      fzf
      gawk
      git
      git-crypt
      gnupg
      htop
#      hub
      imagemagick
      jq
#      kitty
#      librsvg
#      lima
#      lzop
#      mdcat
      mosh
      neovim
#      nodejs
      pandoc
#      pv
#      qemu
#      qrencode
#      restic
      ripgrep
      silver-searcher
#      tldr
      tmux
#      yabai
#      skhd
#      thefuck
      tree
      wget
      zoxide
#    # language support
      cabal2nix
      cabal-install
#      ormolu
#    #  zlib
#    #  rustc cargo
#    #  stack
    ];

}
