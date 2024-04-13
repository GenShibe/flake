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
      user.signingkey = "2CC04BD99FE8D5CD";
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };
}
