# credit to @uncenter for letting me nab this file
_: {
  programs.git = {
    enable = true;
    difftastic.enable = true;

    ignores = [
      ".DS_Store"
      ".direnv/"
    ];

    userName = "Gen";
    userEmail = "genshibe@gmail.com";

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
