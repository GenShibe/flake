{
  # https://docs.brew.sh/Manpage#environment
  environment.variables = {
    HOMEBREW_NO_ANALYTICS = "1";
    HOMEBREW_NO_INSECURE_REDIRECT = "1";
    HOMEBREW_NO_EMOJI = "1";
  };

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
      upgrade = true;
    };

    taps = [
      "homebrew/services"
      "homebrew/cask-versions"
      "homebrew/bundle"
    ];

    brews = [
        "pinentry-mac"
    ];

    casks = [
      "discord"
      "transmission"
      "docker"
      "shottr"
      "knockknock"
      "google-earth-pro"
      "orion"
      "sf-symbols"
      "zed"
      "stats"
    ];
  };
}
