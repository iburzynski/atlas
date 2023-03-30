{pkgs, config, ...}: {
  # name = "project-name";
  compiler-nix-name = "ghc8107"; # Version of GHC to use

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
      cabal = "latest";
      hlint = "3.4.1";
      haskell-language-server = "latest";
    };

    buildInputs = with pkgs; [
      jq
      config.hsPkgs.cardano-node.components.exes.cardano-node
      config.hsPkgs.cardano-cli.components.exes.cardano-cli
    ];
  };
}
