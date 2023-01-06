{
  description = "My System Config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-22.11";
    home-manager.url = "github:nix-community/home-manager/release-22.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # vim-extra-plugins.url = "github:m15a/nixpkgs-vim-extra-plugins";
    vim-extra-plugins.url = "github:dearrrfish/nixpkgs-vim-extra-plugins";
  };

  outputs = { nixpkgs, home-manager, vim-extra-plugins, ... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = { allowUnfree = true; };
      overlays = [ vim-extra-plugins.overlays.default ];
    };
    lib = nixpkgs.lib;
  in {
    homeConfigurations = {
      marcus = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./users/marcus/home.nix
        ];
      };
    };


    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;

        modules = [
          ./system/configuration.nix
        ];
      };
    };
  };
}
