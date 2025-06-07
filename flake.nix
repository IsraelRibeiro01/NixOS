{
   description = "Nix Flake";

   inputs = {
     nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
     home-manager.url = "github:nix-community/home-manager/release-25.05";
     home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {self, nixpkgs, home-manager, ...}@inputs:
	let
	  system = "x86_64-linux";
	  hostname = "nixos";
        in {
      nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; };

      modules = [
      ./configuration.nix
      home-manager.nixosModules.home-manager
      {
      home-manager = {
        useGlobalPkgs = true;
	useUserPackages = true;
	extraSpecialArgs = { inherit inputs; };
	users.gaku = {
	imports = [ ./home.nix ];
	  };
	};
      }    
    ];
  };
 };
} 
