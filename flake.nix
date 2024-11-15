{
  description = "My WIP MacOS flake";
  inputs = {
  # Moving to staging-next 11.15.24 due to https://github.com/NixOS/nixpkgs/pull/350374
  #  nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
  #  nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/unstable";

    # Manages configs links things into your home directory
  #  home-manager.url = "github:nix-community/home-manager/release-24.05"; #Aligning back to current
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Controls system level software and settings including fonts
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

  };
  outputs = inputs@{ nixpkgs, home-manager, darwin, ... }: {
    darwinConfigurations.Ungyo = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      pkgs = import nixpkgs { 
        system = "aarch64-darwin";
        config.allowUnfree = true; #testing
        };
      modules = [
        ./modules/darwin
        home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.justin.imports = [ ./modules/home-manager ];
          };
        }
      ];
    };
  };
}
