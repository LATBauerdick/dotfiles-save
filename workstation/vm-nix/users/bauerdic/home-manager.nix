{ config, lib, pkgs, ... }:

let sources = import ../../nix/sources.nix;
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
    pkgs.ghc
    pkgs.neuron
    pkgs.firefox
    pkgs.kitty
    pkgs.okular
    pkgs.pandoc
    pkgs.texlive.combined.scheme-full

    pkgs.rnix-lsp

    pkgs.git-crypt
    pkgs.gopls
    pkgs.rofi
    pkgs.watch

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

  home.file.".inputrc".source = ./inputrc;

  xdg.configFile."i3/config".text = builtins.readFile ./i3;
  xdg.configFile."rofi/config.rasi".text = builtins.readFile ./rofi;

  # tree-sitter parsers
#  xdg.configFile."nvim/parser/proto.so".source = "${pkgs.tree-sitter-proto}/parser";
#  xdg.configFile."nvim/queries/proto/folds.scm".source =
#    "${sources.tree-sitter-proto}/queries/folds.scm";
#  xdg.configFile."nvim/queries/proto/highlights.scm".source =
#    "${sources.tree-sitter-proto}/queries/highlights.scm";
#  xdg.configFile."nvim/queries/proto/textobjects.scm".source =
#    ./textobjects.scm;

  #---------------------------------------------------------------------
  # Programs
  #---------------------------------------------------------------------

  programs.bash = {
    enable = true;
    shellOptions = [];
    historyControl = [ "ignoredups" "ignorespace" ];
    initExtra = builtins.readFile ./bashrc;

    shellAliases = {
      ga = "git add";
      gc = "git commit";
      gco = "git checkout";
      gcp = "git cherry-pick";
      gdiff = "git diff";
      gl = "git prettylog";
      gp = "git push";
      gs = "git status";
      gt = "git tag";
    };
  };

  programs.git = {
    enable = true;
    userName = "LATBauerdick";
    userEmail = "github@bauerdick.org";
    aliases = {
      prettylog = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(r) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
      root = "rev-parse --show-toplevel";
      hist = "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short";
    };
    extraConfig = {
      color.ui = true;
      core.askPass = ""; # needs to be empty to use terminal for ask pass
      credential.helper = "store"; # want to make this more secure
      github.user = "latbauerdick";
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };

  programs.tmux = {
    enable = true;
    terminal = "xterm-256color";
    shortcut = "l";
    secureSocket = false;

    extraConfig = ''
      set -ga terminal-overrides ",*256col*:Tc"

      set -g @dracula-show-battery false
      set -g @dracula-show-network false
      set -g @dracula-show-weather false

      bind -n C-k send-keys "clear"\; send-keys "Enter"

      run-shell ${sources.tmux-pain-control}/pain_control.tmux
      run-shell ${sources.tmux-dracula}/dracula.tmux
    '';
  };

  programs.kitty = {
    enable = true;
    extraConfig = builtins.readFile ./kitty;
  };

  programs.i3status = {
    enable = true;

    general = {
      colors = true;
      color_good = "#8C9440";
      color_bad = "#A54242";
      color_degraded = "#DE935F";
    };

    modules = {
      ipv6.enable = false;
      "wireless _first_".enable = false;
      "battery all".enable = false;
    };
  };

#  programs.neovim = {
#    enable = true;
#    package = pkgs.neovim-nightly;
#
#    plugins = with pkgs; [
#      customVim.vim-fish
#      customVim.vim-fugitive
#      customVim.vim-misc
#      customVim.vim-tla
#      customVim.pigeon
#      customVim.AfterColors
#
#      customVim.vim-nord
#      customVim.nvim-lspconfig
#      customVim.nvim-treesitter
#      customVim.nvim-treesitter-playground
#      customVim.nvim-treesitter-textobjects
#
#      vimPlugins.ctrlp
#      vimPlugins.vim-airline
#      vimPlugins.vim-airline-themes
#      vimPlugins.vim-eunuch
#      vimPlugins.vim-gitgutter
#
#      vimPlugins.vim-markdown
#      vimPlugins.vim-nix
#      vimPlugins.typescript-vim
#    ];
#
#    extraConfig = (import ./vim-config.nix) { inherit sources; };
#  };

  xresources.extraConfig = builtins.readFile ./Xresources;

  # Make cursor not tiny on HiDPI screens
  xsession.pointerCursor = {
    name = "Vanilla-DMZ";
    package = pkgs.vanilla-dmz;
    size = 128;
  };
}