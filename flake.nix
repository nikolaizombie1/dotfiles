{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nikolaizombie1 = {
      url = "github:nikolaizombie1/nur-packages";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    waytrogen = {
      url = "github:nikolaizombie1/waytrogen";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, ...} @ inputs: {

    nixosConfigurations.uwu = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./configuration.nix
      ];
    };
  };
}
