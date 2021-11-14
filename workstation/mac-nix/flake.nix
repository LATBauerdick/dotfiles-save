{
  description = "Nix Config for Mac by LATB";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-21.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-21.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager-unstable = {
      url = "github:nix-community/home-manager/release-21.05";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = { self, nixpkgs, home-manager, nixpkgs-unstable, home-manager-unstable, ... }@inputs:
  let
#    system = "x86_64-linux";
    system = "x86_64-darwin";
    nixpkgs = nixpkgs-unstable;
    home-manager = home-manager-unstable;
    pkgs = import nixpkgs {
      inherit system;
      config = { allowUnfree = true; };
    };

    lib = nixpkgs.lib;

  in {
    homeManagerConfigurations = {
      bauerdic = home-manager.lib.homeManagerConfiguration {
        inherit system pkgs;
        username = "bauerdic";
        homeDirectory = "/home/bauerdic";
        configuration = {
          imports = [
            ./users/bauerdic/home.nix
          ];
        };
      };
    };

#    nixosConfigurations = {
#      nix-latb = lib.nixosSystem {
#        inherit system;
#
#        modules = [
#          ./system/configuration.nix
#        ];
#      };
#    };
  };
}
