{
  description = "My environment for cobol programming";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };

        cobolPkg = pkgs.emacsPackages.cobol-mode;
        cobolPath = "${cobolPkg}/share/emacs/site-lisp/elpa/cobol-mode-${cobolPkg.version}";
      in
        {
          devShell = pkgs.mkShell {
            buildInputs = [ 
              pkgs.gnucobol
              cobolPkg
            ];
            
            shellHook = ''
              export EMACSLOADPATH="${cobolPath}:$EMACSLOADPATH"
            '';
          };
        });
}
