{
  lib,
  pkgs,
  config,
  ...
}: {
  programs.fish = {
    enable = true;
    catppuccin.enable = true;

    shellAliases = {
      "ll" = "ls -la";
    };

    plugins = [
      {
        name = "autopair";
        src = pkgs.fetchFromGitHub {
          owner = "jorgebucaran";
          repo = "autopair.fish";
          rev = "244bb1ebf74bf944a1ba1338fc1026075003c5e3";
          sha256 = "sha256-s1o188TlwpUQEN3X5MxUlD/2CFCpEkWu83U9O+wg3VU=";
        };
      }
    ];

    shellInit = ''
      source ${./fish/config.fish}
    '';

    # Functions from https://github.com/uncenter/flake/blob/7de08508d4d363d2b0e590574b906252091800fc/home/programs/fish.nix#L63-L85.
    functions = {
      take = ''
        set dir $argv[1]
        if test -z "$dir"
            return 1
        end

        mkdir -p "$dir"
        cd "$dir"
      '';

      have = ''
        command -v $argv > /dev/null
      '';

      pngtowebp = ''
        for file in *.png
          set output (basename $file .png).webp
          cwebp -lossless $file -o $output
        end
      '';
    };
  };
}
