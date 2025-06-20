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
      nix_hostname = "nixos";
      nix_username = "g23beaum";
      darwin_hostname = "Gwendals-MacBook-Pro";
      darwin_username = "gwendalbeaumont";

	#      mkNixosConfiguration = hostname: username:
	#      nixpkgs.lib.nixosSystem {
	# specialArgs = {
	#   inherit inputs outputs hostname;
	#   userConfig = users.${username};
	#   nixosModules = "${self}/modules/nixos";
	# };
	# modules = [ ./hosts/${hostname} ];
	#      };

	  #    mkDarwinConfiguration = hostname: username:
	  #    nix-darwin.lib.darwinSystem {
	  # system = "aarch64-darwin";
	  # specialArgs = {
	  #   inherit inputs outputs hostname;
	  #   userConfig = users.${username};
	  # };
	  # modules = [
	  #   ./hosts/${hostname}
	  #   home-manager.darwinModules.home-manager
	  #   {
	  #     home-manager.useGlobalPkgs = true;
	  #     home-manager.useUserPackages = true;
	  #     home-manager.users.gwendalbeaumont = ./home.nix;
	  #   }
	  # ];
	  #    };

	  #    mkHomeConfiguration = system: hostname: username:
	  #    home-manager.lib.homeManagerConfiguration {
	  # pkgs = import nixpkgs { inherit system; };
	  #
	  # extraSpecialArgs = {
	  #   inherit inputs outputs;
	  #   userConfig = users.${username};
	  #   nhModules = "${self}/modules/home-manager";
	  # };
	  #
	  # modules = [
	  #   ./home/${hostname}
	  # ];
	  #    };
    in
    {
      nixosConfigurations = {
	"${nix_hostname}" = nixpkgs.lib.nixosSystem {
	  specialArgs = {
	    inherit nix_username;
	  };

	  modules = [
	    ./hosts/${nix_hostname}

	    # Home-Manager
	    home-manager.nixosModules.home-manager
	    {
	      home-manager.useGlobalPkgs = true;
	      home-manager.useUserPackages = true;
	      home-manager.users.${nix_username} = ./home/common;

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

    darwinConfigurations = {
      "${darwin_hostname}" = nix-darwin.lib.darwinSystem {
	modules = [
	  ./hosts/${darwin_hostname}

	  home-manager.darwinModules.home-manager
	  {
	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;
	    home-manager.users.${darwin_username} = ./home/${darwin_hostname};
	  }
	];
      };
    };
  };
}
