# Adapted from https://github.com/uncenter/flake.
{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs;
  with inputs.catppuccin-toolbox.packages.${pkgs.system}; [
    inputs.home-manager.packages.${pkgs.system}.home-manager

    # Essentials #
    coreutils
    curl
    git-lfs
    gnupg
    wget
    kittysay

    # Nix #
    alejandra
    statix

    # Catppuccin #
    whiskers
    catwalk

    # Image & Video #
    ffmpeg
    imagemagick
    libwebp
    inkscape-with-extensions

    # Language Tools & Runtimes #
    deno
    fnm
    shellcheck

    # Tools and TUIs #
    cowsay
    gum
    just
    lolcat
    hyfetch
    mommy
  ];
}
