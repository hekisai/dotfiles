# zplugが無ければgitからclone
#if [[ ! -d ~/.zplug ]];then
#  git clone https://github.com/zplug/zplug ~/.zplug
#fi

# zplugを使う
#source ~/.zplug/init.zsh

# zplug plugin
# zplug "ユーザー名/リポジトリ名",タグ

# 自分自身をプラグインとして管理
#zplug "zplug/zplug", hook-build:'zplug --self-manage'
#zplug "zsh-users/zsh-completions"

# インストールしていないプラグインはインストール
#if ! zplug check --verbose; then
#  printf "Install?[y/N]:"
#  if read -q; then
#    echo; zplug install
#  fi
#fi

#コマンドをリンクして、PATHに追加し、プラグインは読み込む
#zplug load -verbose

#PATH
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

#配列番号を0からにする(bashの仕様と同じにする)
setopt ksharrays

# Set up the prompt
autoload -U compinit
#compinit -u
#補完機能を有効にする
#autoload -Uz promptinit
#promptinit
#if [ -e /usr/local/share/zsh-completions ]; then
#  fpath = (/usr/local/share/zsh-completions $fpath)
#fi
#
fpath=(/usr/local/share/zsh-completions ${fpath})

# カラーにする
autoload colors

# PROMPT Setting
# %M    ホスト名
# %m    ホスト名
# %d    カレントディレクトリ(フルパス)
# %~    カレントディレクトリ(フルパス2)
# %C    カレントディレクトリ(相対パス)
# %c    カレントディレクトリ(相対パス)
# %n    ユーザ名
# %#    ユーザ種別
# %?    直前のコマンドの戻り値
# %D    日付(yy-mm-dd)
# %W    日付(yy/mm/dd)
# %w    日付(day dd)
# %*    時間(hh:flag_mm:ss)
# %T    時間(hh:mm)
# %t    時間(hh:mm(am/pm))

local p_cdir="%B%F{blue}[%~]%f%b"$'\n'
local p_info="%n@%m"
PROMPT=" $p_cdir$p_info > "
export LSCOLORS=gxfxcxdxbxegedabagacad

#prompt adam1
setopt histignorealldups sharehistory

#TABで順に補完候補を切り替える
setopt auto_menu

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -v

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# function
# cdを打ったら自動的にlsを打ってくれるコマンド
function cd(){
  builtin cd $@ && ls;
}

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
alias station='station --no-sandbox'

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

#AdoptOpenJDK
export JAVA_HOME=/usr/jdk-11.0.2+9_openj9-0.12.1
export PATH="$JAVA_HOME/bin:$PATH"

#nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

#golang
export PATH=$PATH:/usr/local/go/bin

#rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

#docker tag search
function docker-taglist {
    curl -s https://registry.hub.docker.com/v1/repositories/$1/tags | sed "s/,/\n/g" | grep name | cut -d '"' -f 4
}

#fzf install
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#fzf setting
#ripggripを利用、隠しファイルも対象、.git配下を無視、igtignoreに定義済みの対象を無視、シンボリックリンクを追う
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_CTRL_T_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border --inline-info'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}
