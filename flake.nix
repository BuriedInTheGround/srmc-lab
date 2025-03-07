{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    systems.url = "github:nix-systems/default";
  };

  outputs =
    {
      self,
      nixpkgs,
      systems,
    }:
    let
      eachSystem = nixpkgs.lib.genAttrs (import systems);
    in
    {
      devShells = eachSystem (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          python = pkgs.python3.override {
            self = python;
            packageOverrides = pyfinal: pyprev: {
              cheshire-cat-api = pyfinal.callPackage ./nix/cheshire-cat-api.nix { };
            };
          };
        in
        {
          default = pkgs.mkShell {
            name = "cheshire-cat";
            packages = [
              pkgs.ollama

              (python.withPackages (python-pkgs: [ python-pkgs.cheshire-cat-api ]))
              pkgs.pyright
              pkgs.ruff
            ];
          };
        }
      );
    };
}
