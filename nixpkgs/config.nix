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

  packageOverrides = super: let self = super.pkgs; in
  {
    myHaskellEnv = self.haskell.packages.ghc8104.ghcWithPackages
                     (haskellPackages: with haskellPackages; [
                       zlib
                       # libraries
                       aeson
                       # tools
                       cabal-install haskintex
                     ]);

  };

#  packageOverrides = pkgs: with pkgs; rec {
#    myPackages = pkgs.buildEnv {
#      name = "my-devenv";
#      paths = [
#        wget
#        zsh
#        bind      # for nslookup
#        tree
#        less
#        man
#        tmux
#        neovim
##        git
#        gnuplot
#        stack
#      ];
#      pathsToLink = [ "/share/man" "/share/doc" "/bin" "/etc" ];
#      extraOutputsToInstall = [ "man" "doc" ];
#    };
#  };


}

