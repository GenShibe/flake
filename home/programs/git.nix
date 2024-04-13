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
      user.signingkey = "CE5EAD50DD5E2278";
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };
}
