path=(
  ~/bin ~/local/bin bin ~/usr/local/bin \
  /bin /sbin /usr/local/bin /usr/bin /usr/sbin \
  # for mac
  /opt/local/bin /opt/local/sbin \
)

umask 002

if [ -x "`which emacs`" ]; then
    export EDITOR=emacs
    export CVSEDITOR=emacs
elif [ -x "`which vim`" ]; then
    export EDITOR=vim
    export CVSEDITOR=vim
fi

export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export RSYNC_RSH=ssh
export CVS_RSH=ssh
export CVSROOT=:ext:`whoami`@topaz2.dyndns.org:/CVSROOT
export HOSTNAME=`hostname`
export HOSTNAME_S=`hostname -s`
export XIM_PROGRAM=/usr/bin/ibus-daemon
export XIM_ARGS="--xim"
export XMODIFIERS="@im=ibus"
export GTK_IM_MODULE="ibus"
export QT_IM_MODULE="ibus"
unset LC_ALL
export LC_COLLATE="ja_JP.UTF-8"
export LV='-Ou8'
ANDROID_HOME=~/usr/local/bin/android-sdk-linux
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/build-tools

if which lv >& /dev/null ; then
  export PAGER="lv"
elif which less >& /dev/null ;  then
  export PAGER="less -RM --quiet -x2"
else
  export PAGER="more -x2"
fi

alias a='alias'
a ap='aptitude'
a l='ls -alF'
a ls='ls -F'
a ll='ls -alF'
a ltr='ls -altrF'
a f='find'
a g='egrep'
a c='cat'
a cpr='cp -rp'
a e='emacs -nw'
a emacs='emacs -nw'
a d='dig'
uname=`uname -a`
if [ ! -z "`echo $uname | grep Ubuntu`" ]; then
    a o='gnome-open'
else
    a o='open'
fi

a p='ps aux'
a pi='ping'
a rf='rm -rf'
a t='top'
a ta='tail -f'
a tr='tail -f'
a trt='traceroute'
a tc='tar cvzf'
a tx='tar xvzf'
a v='vim'
a zg='zegrep'
a zl='zless'
a -g G='| egrep'
a -g L='| lv'
a -g S='| sed'
a sag='ssh-agent'
a sa='ssh-add'
a screen="screen -U -t $HOSTNAME_S"
a yui='java -jar /usr/local/src/yuicompressor-2.3.5/build/yuicompressor-2.3.5.jar -v'

