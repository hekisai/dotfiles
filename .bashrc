
PATH=$PATH:$HOME

#alias
alias ls='ls -CFG'
alias ll='ls -AlFhG'
alias la='ls -CFalG'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'

alias vi='vim'

#screen 4.1.0
#alias screen='screen-4.1.0'

#color
#export LSCOLORS=gxfxcxdxbxegedabagacad
export LSCOLORS='GxFxDxDxhxDgDxabagacad'

#Prompt config
#export PS1="[\u@\h \W]\\$"
#export PS1="[\u/\t,\w]"
export PS1="[$HOSTNAME $PWD]"
alias grep='grep --color'

#.screens設定
#デタッチのセッション情報を保存しておく用
export SCREENDIR=$HOME/.screens
if [ ! -d $SCREENDIR ];then
	mkdir -p $SCREENDIR
fi
chmod 700 $SCREENDIR

