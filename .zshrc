### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/z-a-rust \
    zdharma-continuum/z-a-as-monitor \
    zdharma-continuum/z-a-patch-dl \
    zdharma-continuum/z-a-bin-gem-node

### End of Zinit's installer chunk

zinit load "mafredri/zsh-async"

zinit load "zsh-users/zsh-autosuggestions"

zinit load "zsh-users/zsh-completions"

zinit load "zdharma/fast-syntax-highlighting"

zinit light "zdharma/history-search-multi-word"

zinit light "mollifier/anyframe"

#zinit light "gimbo/iterm2-tabs.zsh"

zinit ice from"gh-r" as"program"
zinit load "junegunn/fzf-bin"

bindkey '^xb' anyframe-widget-cdr
bindkey '^x^b' anyframe-widget-checkout-git-branch

bindkey '^xr' anyframe-widget-execute-history
bindkey '^x^r' anyframe-widget-execute-history

bindkey '^xi' anyframe-widget-put-history
bindkey '^x^i' anyframe-widget-put-history

bindkey '^xg' anyframe-widget-cd-ghq-repository
bindkey '^x^g' anyframe-widget-cd-ghq-repository

bindkey '^xk' anyframe-widget-kill
bindkey '^x^k' anyframe-widget-kill

#bindkey '^xe' anyframe-widget-insert-git-branch
#bindkey '^x^e' anyframe-widget-insert-git-branch

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt EXTENDED_HISTORY

setopt HIST_EXPIRE_DUPS_FIRST
# 直前のコマンドの重複を削除
setopt HIST_IGNORE_DUPS
# 同じコマンドをヒストリに残さない
setopt HIST_IGNORE_ALL_DUPS
# 同時に起動したzshの間でヒストリを共有
setopt SHARE_HISTORY
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#export PATH="$HOME/.anyenv/bin:$PATH"
#eval "$(anyenv init - zsh)"
#eval "$(pyenv virtualenv-init -)"
#

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ls='lsd'

# edit command line with $editor
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^x^e" edit-command-line

# cdr settings
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-max 1000
zstyle ':chpwd:*' recent-dirs-default yes
zstyle ':completion:*' recent-dirs-insert both

# enable to use ssh-agent even if tmux detached.
agent="$HOME/.ssh/agent"
if [ -S "$SSH_AUTH_SOCK" ]; then
    case $SSH_AUTH_SOCK in
    /tmp/*/agent.[0-9]*)
        ln -snf "$SSH_AUTH_SOCK" $agent && export SSH_AUTH_SOCK=$agent
    esac
elif [ -S $agent ]; then
    export SSH_AUTH_SOCK=$agent
else
    echo "no ssh-agent"
fi

bindkey -e

# Git
_fzf_complete_git() {
    ARGS="$@"
    local branches
    branches=$(git branch -vv --all)
    if [[ $ARGS == 'git co'* ]]; then
        _fzf_complete --reverse --multi -- "$@" < <(
            echo $branches
        )
    else
        eval "zle ${fzf_default_completion:-expand-or-complete}"
    fi
}

_fzf_complete_git_post() {
    awk '{print $1}'
}

export CLICOLOR=1
#export LSCOLORS=CxGxcxdxCxegedabagacad
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

export EDITOR=nvim

# delete word units
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
function _kill-backward-blank-word() {
  zle set-mark-command
  zle vi-backward-blank-word
  zle kill-region
}
zle -N _kill-backward-blank-word
bindkey '^Y' _kill-backward-blank-word

# history search with fzf
function select-history() {
  BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
}
zle -N select-history
bindkey '^r' select-history

# This is necessary to configure folloing settings.
export PATH="$HOME/.nix-profile/bin:$PATH"

# direnv was installed by nix-env
eval "$(direnv hook zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/okazaki/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/okazaki/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/okazaki/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/okazaki/google-cloud-sdk/completion.zsh.inc'; fi

# zsh-completions(補完機能)の設定
if [ -e /nix/store/472q9jrpbsjxn4d6i1splk7b9218ia9z-zsh-completions-0.33.0/share/zsh/site-functions ]; then
    fpath=( /nix/store/472q9jrpbsjxn4d6i1splk7b9218ia9z-zsh-completions-0.33.0/share/zsh/site-functions $fpath)
fi

if [ -e ~/.config/zsh/completions ]; then
  fpath=( ~/.config/zsh/completions "${fpath[@]}" )
fi

alias ..='cd ..'
alias ...='cd ../../'
alias ll='ls -alFrt'
alias la='ls -A'
alias l='ls -CF'
alias c='clear'
alias nims='nim --hints:off'

# load functions under funcs directory
if [ -e ~/.config/zsh/funcs ]; then
  for f in ~/.config/zsh/funcs/*(.)
  do
    autoload -Uz "$f"
  done
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# to use docker completion, following repository should be cloned
# $ git clone https://github.com/kwhrtsk/docker-fzf-completion
test -e "$HOME/.config/zsh/docker-fzf-completion" && source "$HOME/.config/zsh/docker-fzf-completion/docker-fzf.zsh"

# path to protoc
export PATH="$HOME/.local/share/protoc/bin:$PATH"

# for nim
export PATH=/Users/okazaki/.nimble/bin:$PATH

# GCP
export GOOGLE_APPLICATION_CREDENTIALS=$HOME/.gcp/magellan-blocks-blocks-gn-okazaki-3f71993b0749.json
export PROJECT_ID=blocks-gn-okazaki

# AWS
export PATH="$HOME/.aws/bin:$PATH"

complete -C '$HOME/.aws/bin/aws_completer' aws

# asdf
. $HOME/.asdf/asdf.sh

# docker
PATH="$PATH:/Users/okazaki/Library/Application Support/multipass/bin"

# starship (https://starship.rs/)
eval "$(starship init zsh)"

# zoxide https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init zsh)"

export PATH="$PATH:/usr/local/opt/qt@5.5/bin"

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
