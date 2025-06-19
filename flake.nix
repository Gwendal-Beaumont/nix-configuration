{
  description = "My Entrypoint Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

    hyprpanel = {
      url = "github:Jas-SinghFSU/HyprPanel";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nix-flatpak, ... }@inputs: 
    let
      system = "x86_64-linux";
      host = "nixos";
      username = "g23beaum";
    in {
    nixosConfigurations = {
      "${host}" = nixpkgs.lib.nixosSystem {
        specialArgs = {
	  inherit system;
	  inherit username;
	};

        modules = [
      	  ./hosts/${host}/configuration.nix

	  # Home-Manager
	  home-manager.nixosModules.home-manager
	  {
	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;
	    home-manager.users.${username} = ./home/common;

	    # Optionally, use home-manager.extraSpecialArgs to pass
	    # arguments to home.nix
	  }

	  nix-flatpak.nixosModules.nix-flatpak
	  ./flatpak.nix

	  {
	    nixpkgs.overlays = [
	      inputs.hyprpanel.overlay
	    ];
	  }
        ];
      };
    };
  };
}
