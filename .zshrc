# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
    . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
else
    export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
fi
# <<< conda initialize <<<

# fnm
FNM_PATH="/Users/azhar/Library/Application Support/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/Users/azhar/Library/Application Support/fnm:$PATH"
  eval "`fnm env`"
fi
eval "$(fnm env --use-on-cd --shell zsh)"

# starship
eval "$(starship init zsh)"

# vim mode
bindkey -v
export KEYTIMEOUT=1

# nice zsh stuff
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# postgres path
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

# composer path
export PATH="$PATH:/Users/azhar/.config/composer/vendor/bin"

# fzf init
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fzf catppuccin-macchiato-transparent
export FZF_DEFAULT_OPTS=" \
--color=bg+:,bg:,spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"

# # yazi
# function y() {
#     local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
#     yazi "$@" --cwd-file="$tmp"
#     if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
#         builtin cd -- "$cwd"
#     fi
#     rm -f -- "$tmp"
# }

# cool and useful scripts

# search and change directory
alias od="cd \`fd --type d --exclude '{node_modules,Applications,Library}' | fzf\`"

# search, change directory, and open a file in neovim
function of() {
    local file
    file=$(fd --type f --exclude '{node_modules,Applications,Library,Games,Downloads,Documents,go}' | fzf --preview 'bat --style=numbers --color=always {}')
    if [[ -n "$file" ]]; then
        local dir
        dir=$(dirname "$file")
        cd "$dir" && nvim "$(basename "$file")"
    fi
}

# quick extract
function extract() {
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2)   tar xjf "$1"                 ;;
            *.tar.gz)    tar xzf "$1"                 ;;
            *.tar.xz)    tar xf "$1"                  ;;
            *.zip)       unzip "$1"                   ;;
            *.rar)       7zz x "$1"                   ;;
            *.7z)        7zz x "$1"                   ;;
            *) echo "Unsupported file type"; return 1 ;;
        esac
    else
        echo "$1 is not a valid file."
    fi
}

export PATH="$PATH:$HOME/bin"

# journal
function j() {
    local VAULT="$HOME/vault"
    local JOURNAL="$VAULT/01-Journal"

    local YEAR="$(date +%Y)"
    local MONTH_NUM="$(date +%m)"
    local MONTH_NAME="$(date +%B)"
    local MONTH_DIR="${MONTH_NUM}-${MONTH_NAME}"

    local DATE_FILE="$(date +%Y-%m-%d-%A).md"

    # IMPORTANT: local time, dynamic timezone
    local CREATED_AT="$(date +%Y-%m-%dT%H:%M:%S%z)"

    local DIR="$JOURNAL/$YEAR/$MONTH_DIR"
    local FILE="$DIR/$DATE_FILE"

    mkdir -p "$DIR"

    if [[ ! -f "$FILE" ]]; then
        cat <<EOF > "$FILE"
---
createdAt: $CREATED_AT
tags:
  - Daily
---

EOF
    fi

    ${EDITOR:-nvim} "$FILE"
}

# Added by Antigravity
export PATH="/Users/azhar/.antigravity/antigravity/bin:$PATH"
