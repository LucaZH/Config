if status is-interactive
    set -g fish_greeting ""
end

function nvm
    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

function start_ssh_agent
    if not pgrep ssh-agent > /dev/null
        eval (ssh-agent -c)
    end
end

start_ssh_agent
# Main colors
set -g fish_color_normal f8f8f2
set -g fish_color_command 50fa7b 
set -g fish_color_param bd93f9
set -g fish_color_quote f1fa8c
set -g fish_color_redirection 8be9fd
set -g fish_color_end 50fa7b
set -g fish_color_error ff5555 
set -g fish_color_comment 6272a4
set -g fish_color_selection --background=44475a
set -g fish_color_operator 8be9fd

# Special colors
set -g fish_color_autosuggestion 6272a4 
set -g fish_color_cancel -r
set -g fish_color_escape ff79c6
set -g fish_color_history_current --bold
set -g fish_color_search_match --background=44475a
set -g fish_color_valid_path --underline

# Status colors
set -g fish_color_cwd 50fa7b 
set -g fish_color_cwd_root ff5555 
set -g fish_color_host normal
set -g fish_color_user 8be9fd 
set -g fish_color_status ff5555

# Completion pager colors
set -g fish_pager_color_progress 6272a4
set -g fish_pager_color_prefix 8be9fd
set -g fish_pager_color_completion f8f8f2
set -g fish_pager_color_description 6272a4
set -g fish_pager_color_selected_background --background=44475a

# ===== Aliases =====
alias ll 'ls -la'
alias la 'ls -A'
alias l 'ls -CF'

alias .. 'cd ..'
alias ... 'cd ../..'
alias c 'clear'
alias h 'history'

alias gs 'git status'
alias ga 'git add'
alias gc 'git commit'
alias gp 'git push'
alias gl 'git log'

if test -d ~/.local/bin
    if not contains -- ~/.local/bin $PATH
        set -p PATH ~/.local/bin
    end
end

function mkcd
    mkdir -p $argv && cd $argv
end

# Quick file backup
function backup
    cp -r $argv $argv.bak
end
