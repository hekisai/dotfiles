#path
export PATH=$PATH:$HOME/bin

export LANG=ja_JP.UTF-8

#直前のコマンドの重複を削除
setopt hist_ignore_dups

#同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

#同時に起動したzshの間でヒストリを共有
setopt share_history

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# Set up the prompt
#補完機能を有効にする
autoload -Uz promptinit
promptinit
if [ -e /usr/local/share/zsh-completions ]; then
  fpath = (/usr/local/share/zsh-completions $fpath)
fi

fpath=(~/.zsh/completion $fpath)

# カラーにする
autoload colors
colors

# PROMPT Setting
local p_cdir="%B%F{blue}[%~]%f%b"$'\n'
local p_info="%n@%m"
PROMPT=" $p_cdir$p_info > "
export LSCOLORS=gxfxcxdxbxegedabagacad
#

#prompt adam1
setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# alias
alias ls='ls -CFG --color=auto'
alias ll='ls -AlFhG'
alias la='ls -CFalG'
alias rm='rm -i'
alias cp='cp -i'
alias vi='vim'
alias tmux='tmux -2'

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

#PYENV setup
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

#neovim setup
export XDG_CONFIG_HOME=~/.config

#nodebrew steup
export PATH=$HOME/.nodebrew/current/bin:$PATH

#golang
export PATH=$PATH:/usr/local/go/bin
