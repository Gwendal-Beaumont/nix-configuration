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

    # nix-darwin (macOS machines)
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nix-flatpak, nix-darwin, ... }@inputs:
    let
      inherit (self) outputs;

      mkNixosConfiguration = hostname: username:
	nixpkgs.lib.nixosSystem {
	  specialArgs = {
	    inherit inputs outputs hostname username;
	    # nixosModules = "${self}/modules/nixos";
	  };

	  modules = [
	    ./hosts/${hostname}
	    home-manager.nixosModules.home-manager
	    {
	      home-manager.extraSpecialArgs = {
		inherit username;
	      };
	      home-manager.useGlobalPkgs = true;
	      home-manager.useUserPackages = true;
	      home-manager.users.${username} = ./home/${hostname};
	    }

	    nix-flatpak.nixosModules.nix-flatpak
	    ./flatpak.nix
	  ];
	};

      mkDarwinConfiguration = hostname: username:
	nix-darwin.lib.darwinSystem {
	  system = "aarch64-darwin";
	  specialArgs = {
	    inherit inputs outputs hostname username;
	  };

	  modules = [
	    ./hosts/${hostname}
	    home-manager.darwinModules.home-manager
	    {
	      home-manager.extraSpecialArgs = {
		inherit username;
	      };
	      home-manager.useGlobalPkgs = true;
	      home-manager.useUserPackages = true;
	      home-manager.users.${username} = ./home/${hostname};
	    }
	  ];
	};

	#      mkHomeConfiguration = system: hostname: username:
	# home-manager.lib.homeManagerConfiguration {
	#  pkgs = import nixpkgs { inherit system; };
	#
	#   extraSpecialArgs = {
	#     inherit inputs outputs;
	#     userConfig = users.${username};
	#     nhModules = "${self}/modules/home-manager";
	#   };
	#
	#   modules = [
	#     ./home/${hostname}
	#
	#     {
	#       home-manager.useGlobalPkgs = true;
	#       home-manager.useUserPackages = true;
	#       home-manager.users.${username} = ./home/${hostname};
	#
	#       # Optionally, use home-manager.extraSpecialArgs to pass
	#       # arguments to home.nix
	#     }
	#   ];
	# };
    in
    {
      nixosConfigurations = {
	"nixos" = mkNixosConfiguration "nixos" "g23beaum";
      };

      darwinConfigurations = {
	"Gwendals-MacBook-Pro" = mkDarwinConfiguration "Gwendals-MacBook-Pro" "gwendalbeaumont";
      };

	#      homeManagerConfiguration = {
	# "g23beaum@nixos" = mkHomeConfiguration "x86_64-linux" "nixos" "g23beaum";
	# "gwendalbeaumont@Gwendals-MacBook-Pro" = mkHomeConfiguration "aarch64-darwin" "Gwendals-MacBook-Pro" "gwendalbeaumont";
	#      };
    };
}
