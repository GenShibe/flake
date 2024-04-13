/opt/homebrew/bin/brew shellenv | source

# https://fishshell.com/docs/current/cmds/fish_add_path.html

fish_add_path -Pm /etc/profiles/per-user/$USER/bin /run/current-system/sw/bin
fish_add_path $GOPATH/bin
fish_add_path $CARGO_HOME/bin
fish_add_path $PNPM_HOME

function newlinefix --on-event fish_prompt
    if test -z "$NEW_LINE_BEFORE_PROMPT"
        set -gx NEW_LINE_BEFORE_PROMPT 1
    else if test "$NEW_LINE_BEFORE_PROMPT" -eq 1
        echo
    end
end
function clear
    set -gx NEW_LINE_BEFORE_PROMPT
    command clear
end
function reset
    set -gx NEW_LINE_BEFORE_PROMPT
    command reset
end
function update
  brew update
  brew upgrade
  brew cleanup --prune=all
  cargo install-update -ag
  softwareupdate -i -a --verbose
end
function mommy_ --on-event fish_postexec
    mommy -1 -s $status
end

starship init fish | source

# https://fishshell.com/docs/current/cmds/fish_greeting.html
set fish_greeting
