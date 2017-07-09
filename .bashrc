PATH=$PATH:$HOME

#alias
alias ls='ls -CFG'
alias ll='ls -AlFhG'
alias la='ls -CFalG'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'

alias vi='vim'

alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport'

#color
#export LSCOLORS=gxfxcxdxbxegedabagacad
#export LSCOLORS='GxFxDxDxhxDgDxabagacad'
export LSCOLORS=gxfxcxdxbxegedabagacad
#Prompt config
#export PS1="[\u@\h \W]\\$"
#export PS1="[\u/\t,\w]"
export PS1="[\t,\w]$"
#export PS1="[$HOSTNAME $PWD]"
alias grep='grep --color'

#.screens設定
#デタッチのセッション情報を保存しておく用
export SCREENDIR=$HOME/.screens
if [ ! -d $SCREENDIR ];then
	mkdir -p $SCREENDIR
fi
chmod 700 $SCREENDIR

# macでchromeをターミナルから起動する。
alias chrome="open -a /Applications/Google Chrome.app"

#java設定
#export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export JAVA_HOME=$(/usr/libexec/java_home)

export PLANTUML_JAR="/usr/local/Cellar/plantuml/8053/libexec/plantuml.jar"
