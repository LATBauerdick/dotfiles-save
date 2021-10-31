{
  description = "NixOS systems and tools / thanks to @mitchellh";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-21.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-21.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  outputs = { self, nixpkgs, home-manager, nixpkgs-unstable, home-manager-unstable }:
  let
    mkmachine = import ./lib/mkmachine.nix;
  in {
    nixosConfigurations.cloud= mkmachine "cloud" {
      inherit nixpkgs home-manager;
      system = "x86_64-linux";
      user   = "bauerdic";
    };

    nixosConfigurations.vm-aarch64 = mkmachine "vm-aarch64" {
      nixpkgs = nixpkgs-unstable;
      home-manager = home-manager-unstable;
      system = "aarch64-linux";
      user   = "bauerdic";
    };

    nixosConfigurations.vm-intel = mkmachine "vm-intel" {
      inherit nixpkgs home-manager;
      system = "x86_64-linux";
      user   = "bauerdic";
    };
  };
}
