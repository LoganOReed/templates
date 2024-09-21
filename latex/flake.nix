# edited from https://flyx.org/nix-flakes-latex/

{
  description = "LaTeX Template";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    flake-utils,
    ...
  }: let
    supportedSystems = [
      "x86_64-linux"
      "aarch64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ];
    documentName = "000-main";
    outputName = "output";
  in 
    flake-utils.lib.eachSystem supportedSystems (system: let
      pkgs = import nixpkgs {
        inherit system;
      };

      # use this to get everything
      # scheme-medium also works (probably)
      tex = pkgs.texlive.combined.scheme-full;

      # use this and add what you need for a lighter load on your nix store
      # tex = pkgs.texlive.combine {
      #   inherit (pkgs.texlive) scheme-basic latexmk;
      # };

        document = import ./nix/mkDocument.nix {
          inherit pkgs;
            src = self;
            name = outputName;
            texlive = tex;
            shellEscape = true;
            minted = true;
            SOURCE_DATE_EPOCH = toString self.lastModified;
        };

        shell = pkgs.mkShell {
          name = "live-view-devShell";
          buildInputs = with pkgs; [
            texlab
            tex
            zathura
            coreutils
            perl
            which
            python39Packages.pygments
          ];

          shellHook = ''
            export AUX=$(mktemp -d)
            latexmk -auxdir=$AUX -lualatex -pretex="\pdfvariable suppressoptionalinfo 512\relax" -usepretex \
            --jobname="${outputName}" -pvc ${documentName}.tex -shell-escape -e '$pdf_previewer=q[zathura %S];'
          '';
        };
      in {
        packages.default = document;
        devShells.default = shell;
      });
  }
