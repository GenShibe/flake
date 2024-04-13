# credit to @uncenter for letting me nab this file
{
  config,
  inputs,
  ...
}: {
  programs.home-manager.enable = true;

  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin

    ./variables.nix
    ./fonts.nix
    ./apps/vscode.nix
    ./programs/fish.nix
    ./programs/git.nix
    ./programs/rust.nix
    ./programs/starship.nix

    ./scripts.nix
  ];

  xdg.enable = true;

  catppuccin.flavour = "frappe";
  catppuccin.accent = "peach";

  home.stateVersion = "23.05";
}
