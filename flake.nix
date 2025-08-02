{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    waytrogen = {
      url = "github:nikolaizombie1/waytrogen";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    audio_output_switcher = {
      url = "github:nikolaizombie1/audio_output_switcher";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    color_scheme_generator = {
      url = "github:nikolaizombie1/color_scheme_generator";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    gamut-cli = {
      url = "github:nikolaizombie1/gamut-cli";
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
