# adapted from https://github.com/uncenter/flake
_: {
  programs.git = {
    enable = true;
    difftastic.enable = true;

    ignores = [
      ".DS_Store"
      ".direnv/"
    ];

    userName = "GenShibe";
    userEmail = "buzhybrid@gmail.com";

    lfs = {
        enable = true;
        skipSmudge = true;
    };

    extraConfig = {
      user.signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJJwGGjfCAKCmwOs/lhMOrRdcsYoFCm+SRMFGffPblkW";
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      gpg.format = "ssh";
      commit.gpgsign = true;
    };
  };


  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };
}
