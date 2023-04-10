{pkgs, config, ...}: {
  # name = "project-name";
  compiler-nix-name = "ghc925"; # Version of GHC to use

  # Cross compilation support:
  # crossPlatforms = p: pkgs.lib.optionals pkgs.stdenv.hostPlatform.isx86_64 ([
  #   p.mingwW64
  #   p.ghcjs
  # ] ++ pkgs.lib.optionals pkgs.stdenv.hostPlatform.isLinux [
  #   p.musl64
  # ]);

  # Tools to include in the development shell
  shell = {
    tools = {
#      cabal = "3.8.1.0";
#      hlint = "3.4.1";
#      haskell-language-server = { version = "1.8.0.0"; index-state = "2022-12-17T00:00:00Z"; };
      cabal = {};
      hlint = {};
      haskell-language-server = {};
    };

    buildInputs = with pkgs; [
      jq
      config.hsPkgs.cardano-node.components.exes.cardano-node
      config.hsPkgs.cardano-cli.components.exes.cardano-cli
    ];
  };
}
