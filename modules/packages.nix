# credits to @uncenter for letting me nab this file
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
    gcc
    git-lfs
    gnupg
    wget

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

    # Language Tools & Runtimes #
    deno
    fnm
    shellcheck

    # Tools and TUIs #
    bottom
    cowsay
    gum
    hyperfine
    just
    lolcat
  ];
}
