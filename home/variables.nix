{config, ...}: {
  home.sessionVariables = {
    GIT_CONFIG_GLOBAL = "${config.xdg.configHome}/git/config";
    NPM_CONFIG_USERCONFIG = "${config.xdg.configHome}/npm/npmrc";
    NODE_REPL_HISTORY = "${config.xdg.dataHome}/nodejs/history";
    GNUPGHOME = "${config.xdg.configHome}/gnupg";
  };
}
