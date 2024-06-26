# Adapted from https://github.com/uncenter/flake.
{
  self,
  pkgs,
  inputs,
  config,
  ...
}: {
  services.nix-daemon.enable = true;
  nix.package = pkgs.nixVersions.unstable;

  nix.registry = {
    n.flake = inputs.nixpkgs;
  };

  nix.nixPath = [
    "nixpkgs=${inputs.nixpkgs.outPath}"
  ];

  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
    extra-platforms = ["x86_64-darwin" "aarch64-darwin"];

    build-users-group = "nixbld";
    trusted-users = ["gen"];
    sandbox = true;
    use-xdg-base-directories = true;

    nix-path = config.nix.nixPath;
  };

  nixpkgs = {
    overlays = [
    ];

    config.allowUnfree = true;
    hostPlatform = "x86_64-darwin";
  };
}
