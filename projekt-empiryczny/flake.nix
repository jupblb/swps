{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url     = "github:NixOS/nixpkgs/release-23.11";
  };

  outputs = { self, flake-utils, nixpkgs }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs           = (import nixpkgs) { inherit system; };
        pythonWithPkgs = pkgs.python3.withPackages(p: with p; [
        ]);
      in {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs;
            [ pyright pythonWithPkgs ruff ruff-lsp ];
          shellHook   = ''
            PYTHONPATH=${pythonWithPkgs}/${pythonWithPkgs.sitePackages}
          '';
        };
      }
    );
}
