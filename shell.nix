{ nixpkgs ? import (builtins.fetchTarball {
  name = "nixpkgs-unstable-2021-09-06";
  url = "https://github.com/NixOS/nixpkgs/archive/efcfe3676268c789e78a22b20a94c00227d20bc8.tar.gz";
  sha256 = "0qdxgwk4bqy16vxbb43n0245bdisf1l329ax6gd96576l0ya690s";
  }) {} }:

nixpkgs.haskell.lib.buildStackProject {
  name = "Graphalyze";
  nativeBuildInputs = [ nixpkgs.pkg-config ];
  buildInputs = [ nixpkgs.haskell.compiler.ghc8107
                  nixpkgs.ghcid
                  nixpkgs.cabal-install
                  nixpkgs.zlib
                  nixpkgs.graphviz
                  nixpkgs.haskellPackages.ormolu
                  nixpkgs.haskellPackages.hoogle
                  nixpkgs.haskellPackages.zlib
                  nixpkgs.haskellPackages.hlint
                  (nixpkgs.haskell-language-server.override { supportedGhcVersions = [ "8107" ]; })
                ];
}

  # To use this add the following to the bottom of your stack.yaml
  # nix:
  #   enable: true
  #   shell-file: shell.nix

  # also execute the following in the project root
  # echo "use nix" >> .envrc
  # direnv allow
