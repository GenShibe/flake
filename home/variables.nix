# credits to @uncenter for letting me nab this file
{config, ...}: {
  home.sessionVariables = {
    # https://github.com/b3nj5m1n/xdg-ninja
    ZDOTDIR = "${config.xdg.configHome}/zsh";
    GIT_CONFIG_GLOBAL = "${config.xdg.configHome}/git/config";
    PYENV_ROOT = "${config.xdg.dataHome}/pyenv";
    NPM_CONFIG_USERCONFIG = "${config.xdg.configHome}/npm/npmrc";
    NODE_REPL_HISTORY = "${config.xdg.dataHome}/nodejs/history";
    PNPM_HOME = "${config.xdg.cacheHome}/pnpm";
    CARGO_HOME = "${config.xdg.dataHome}/cargo";
    RUSTUP_HOME = "${config.xdg.dataHome}/rustup";
    GNUPGHOME = "${config.xdg.configHome}/gnupg";
    GOPATH = "${config.xdg.dataHome}/go";
    STACK_XDG = "1";
    DOCKER_CONFIG = "${config.xdg.configHome}/docker";
  };
}
