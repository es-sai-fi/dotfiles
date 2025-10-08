if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Yazi aux function
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# Disable welcome prompt
set fish_greeting ""

# Zoxide integration with fish
zoxide init fish | source

# Starship integration with fish
starship init fish | source
