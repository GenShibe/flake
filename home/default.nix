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
    ./programs/starship.nix
  ];

  xdg.enable = true;

  catppuccin.flavour = "frappe";
  catppuccin.accent = "peach";

  home.stateVersion = "23.05";
}
