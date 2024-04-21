# Copied from https://github.com/uncenter/flake/blob/cbd9706b6aeb3d1e1921b4eb9db6e223166bfdc8/home/programs/fish/config.fish.
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

starship init fish | source

# https://fishshell.com/docs/current/cmds/fish_greeting.html
set fish_greeting
