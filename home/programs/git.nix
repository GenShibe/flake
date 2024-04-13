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
    userEmail = "buzhybrid@gmail.com";

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
