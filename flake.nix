{
  description = "NixOS from bum";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mango = {
      url = "github:mangowm/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    freesmlauncher = {
      url = "github:FreesmTeam/FreesmLauncher";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    vice.url = "github:splitshotz/Vice";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    mango,
    spicetify-nix,
    freesmlauncher,
    nvf,
    vice,
    ...
  } @ inputs: let
    system = "x86_64-linux";

    commonSpecialArgs = {inherit inputs;};
  in {
    nixosConfigurations = {
      nixos-btw = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = commonSpecialArgs;
        modules = [
          ./configuration.nix

          mango.nixosModules.mango

          vice.nixosModules.default
          {services.vice.enable = true;}

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";

              extraSpecialArgs = commonSpecialArgs;
              users.frdd = import ./home.nix;
            };
          }
        ];
      };
    };
  };
}
