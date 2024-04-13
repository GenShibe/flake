# credit to @uncenter for letting me nab this file
{
  pkgs,
  lib,
  ...
}: let
  extensions = [
    "bierner.comment-tagged-templates"
    "bierner.emojisense"
    "bierner.github-markdown-preview"
    "bierner.markdown-checkbox"
    "bierner.markdown-emoji"
    "bierner.markdown-preview-github-styles"
    "bmalehorn.vscode-fish"
    "catppuccin.catppuccin-vsc"
    "catppuccin.catppuccin-vsc-icons"
    "dbaeumer.vscode-eslint"
    "denoland.vscode-deno"
    "editorconfig.editorconfig"
    "esbenp.prettier-vscode"
    "jnoortheen.nix-ide"
    "leonardssh.vscord"
    "timonwong.shellcheck"
    "usernamehw.errorlens"
  ];
in {
  programs.vscode = {
    enable = true;
    package = pkgs.stdenv.mkDerivation {
      pname = "vscode";
      version = "1.87.2";
      dontUnpack = true;
      installPhase = ''
        mkdir -p $out
      '';
    };

    extensions = [];
    mutableExtensionsDir = true;

    userSettings = {
      "workbench.iconTheme" = "catppuccin-frappe";
      "workbench.colorTheme" = "Catppuccin Frappé";
      "workbench.preferredDarkColorTheme" = "Catppuccin Frappé";
      "workbench.preferredLightColorTheme" = "Catppuccin Latte";
      "catppuccin.accentColor" = "peach";

      "workbench.fontAliasing" = "antialiased";
      "workbench.sideBar.location" = "left";
      "workbench.startupEditor" = "none";
      "window.autoDetectColorScheme" = true;
      "workbench.editor.showTabs" = "multiple";
      "window.nativeTabs" = true;
      "window.titleBarStyle" = "native";
      "editor.minimap.enabled" = false;

      "editor.fontFamily" = "MonaSpiceNe Nerd Font";
      "editor.fontLigatures" = true;
      "editor.fontWeight" = "normal";
      "editor.fontSize" = 13;
      "editor.lineHeight" = 1.5;
      "editor.accessibilitySupport" = "off";
      "editor.inlineSuggest.enabled" = true;
      "editor.detectIndentation" = false;
      "editor.stickyScroll.enabled" = false;
      "editor.linkedEditing" = true;
      "workbench.editor.closeOnFileDelete" = true;
      "terminal.integrated.fontSize" = 14;
      "terminal.integrated.lineHeight" = 1.3;
      "terminal.integrated.cursorBlinking" = true;
      "terminal.integrated.defaultProfile.osx" = "/usr/bin/fish";
      "editor.cursorSmoothCaretAnimation" = "off";

      "editor.formatOnSave" = true;
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "editor.tabSize" = 4;
      "prettier.useTabs" = true;

      "[github-actions-workflow]" = {
        "editor.tabSize" = 2;
      };
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil";

      "git.autofetch" = true;
      "git.confirmSync" = false;
      "git.suggestSmartCommit" = false;
      "git.openRepositoryInParentFolders" = "never";

      "files.associations" = {
      };
      "explorer.confirmDelete" = false;
      "explorer.confirmDragAndDrop" = false;
      "explorer.sortOrder" = "type";
      "explorer.fileNesting.enabled" = true;
      "explorer.fileNesting.expand" = false;

      "extensions.ignoreRecommendations" = true;
    };
  };

  home.activation = {
    vscodeExtensions = lib.hm.dag.entryAfter ["writeBoundary"] ''
      code_bin="/usr/local/bin/code"

      if ! command -v "$code_bin" &> /dev/null; then
        echo "code CLI is not available"
        exit 0
      fi

      declare -A currentExtensions
      for extension in $("$code_bin" --list-extensions); do
        currentExtensions["$extension"]=1;
      done

      ${builtins.concatStringsSep
        "\n"
        (
          builtins.map
          (ext: ''
            if [[ -z "''${currentExtensions[${ext}]+unset}" ]]; then
              echo "installing ${ext}"
              $DRY_RUN_CMD "$code_bin" --install-extension ${ext} &> /dev/null
            fi
            unset 'currentExtensions[${ext}]'
          '')
          extensions
        )}

      for ext in "''${!currentExtensions[@]}"; do
        echo "uninstalling $ext"
        $DRY_RUN_CMD "$code_bin" --uninstall-extension $ext &> /dev/null
        unset 'currentExtensions[$ext]'
      done
    '';
  };
}
