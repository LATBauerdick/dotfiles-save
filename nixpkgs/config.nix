# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "US/Central";

  environment.variables = {
    EDITOR = "nvim";
  };

  programs.zsh.enable = true;

  # packageOverrides = super: let self = super.pkgs; in
  # {
  #   myHaskellEnv = self.haskell.packages.ghc822.ghcWithPackages
  #                    (haskellPackages: with haskellPackages; [
  #                      # libraries
  #                      arrows async cgi criterion
  #                      # tools
  #                      cabal-install haskintex
  #                    ]);
  # };

  packageOverrides = pkgs: with pkgs; rec {
    # myProfile = writeText "my-profile" ''
# export PATH=$HOME/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/sbin:/bin:/usr/sbin:/usr/bin
# export MANPATH=$HOME/.nix-profile/share/man:/nix/var/nix/profiles/default/share/man:/usr/share/man
    # '';

    myPackages = pkgs.buildEnv {
      name = "my-packages";
      paths = [
###        python36Packages.powerline
        wget
        zsh
        bind      # for nslookup
        tree
        less
        man
        tmux
        neovim
        coreutils
        git
        gnuplot
        stack
      ];
      pathsToLink = [ "/share/man" "/share/doc" "/bin" "/etc" ];
      extraOutputsToInstall = [ "man" "doc" ];
    };
  };


}

