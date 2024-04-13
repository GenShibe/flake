_: {
  programs.git = {
    enable = true;
    difftastic.enable = true;

    ignores = [
      ".DS_Store"
      ".direnv/"
    ];

    userName = "gen";
    userEmail = "29279972+GenShibe@users.noreply.github.com";

    extraConfig = {
      user.signingkey = "5D63356DC78BB4CDD862F6DDCE5EAD50DD5E2278";
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };
}
