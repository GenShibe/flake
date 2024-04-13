# adapted from https://github.com/uncenter/flake
{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./modules/nix.nix
    ./modules/packages.nix
    ./modules/homebrew.nix
  ];

  # https://daiderd.com/nix-darwin/manual/index.html#sec-options

  system = {
    defaults = {
      dock = {
        autohide = true;
        show-recents = true;
      };
      finder = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        QuitMenuItem = true;
        ShowPathbar = true;
      };
      menuExtraClock = {
        Show24Hour = true;
        ShowDate = 0;
      };
    };
  };

  security.pam.enableSudoTouchIdAuth = true;

  # https://github.com/ryanccn/nix-darwin-custom-icons
  environment.customIcons = {
    enable = true;
    icons = [
      {
        path = "/Applications/Arc.app";
        icon = ./icons/arc.icns;
      }
      {
        path = "/Applications/Discord.app";
        icon = ./icons/discord.icns;
      }
      {
        path = "/Applications/Obsidian.app";
        icon = ./icons/obsidian.icns;
      }
      {
        path = "/Applications/Zoom.app";
        icon = ./icons/zoom.icns;
      }
    ];
  };

  programs.fish.enable = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = {
      inherit inputs;
    };

    users.gen = import ./home;
  };

  users.users.gen = {
    home = "/Users/gen";
    shell = pkgs.fish;
  };

  system.stateVersion = 4;
}
