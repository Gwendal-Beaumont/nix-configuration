{
  description = "My configuration Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nix-darwin (macOS machines)
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nix-darwin, ... }@inputs:
    let
      inherit (self) outputs;

      mkNixosConfiguration = hostname: username:
	nixpkgs.lib.nixosSystem {
	  specialArgs = {
	    inherit inputs outputs hostname username;
	    nixosModules = "${self}/modules/nixos";
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
	      home-manager.verbose = true;
	    }
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
	      home-manager.verbose = true;
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
	"maple" = mkNixosConfiguration "maple" "g23beaum";
      };

      darwinConfigurations = {
	"cedar" = mkDarwinConfiguration "cedar" "gwendalbeaumont";
      };
    };
}
