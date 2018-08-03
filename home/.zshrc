ulimit -c 0                # do not make core files

fpath=(~/.zfunc $fpath)
autoload -U compinit; compinit -u

setopt auto_menu
setopt correct
setopt auto_name_dirs
setopt auto_remove_slash
setopt auto_cd             # cd when only directory name is specified
setopt auto_pushd          # pushd when excuted cd command
setopt pushd_ignore_dups   # Ignore duplicate pushd entry
setopt rm_star_silent
setopt sun_keyboard_hack
setopt extended_glob
setopt list_types
setopt no_beep
setopt no_list_beep
setopt always_last_prompt
setopt cdable_vars
setopt sh_word_split
setopt auto_param_keys
setopt extended_history    # Add timestamp to history
setopt hist_ignore_dups    # Case command already in history. Ignore.
setopt hist_ignore_space   # Ignore if first char of line is white space
setopt prompt_subst
setopt share_history       # Share history over multi process
setopt notify              # Notify when job completed or interrupted
setopt no_flow_control     # Disable flow control. Ctrl-s, Ctrl-q 

bindkey -e

function ssh_screen()
{
  eval server=\${$#}
  screen -t $server ssh "$@"
}
alias sshs=ssh_screen

local GREEN=$'%{\e[1;32m%}'
local YELLOW=$'%{\e[0;33m%}'
local DEFAULT=$'%{\e[1;m%}'

if [ x$YROOT_NAME != x ]; then
  PROMPT=$YELLOW'[${USER}@${YROOT_NAME}] %(!.#.$) '$DEFAULT
else
  PROMPT='[${USER}@%m] %(!.#.$) '
fi
RPROMPT=$GREEN'[%~]'$DEFAULT

zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' use-cache true

HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

function ha()
{
  history -E 1
}

function ds()
{
  if [ -z $1 ]; then
    dirs -v | perl -pe 's/\t/: /g'
  else
    dirs -v | perl -pe 's/\t/: /g' | grep $1
  fi

  echo -n "select number: "
  read newdir
  [ expr $newdir + 0 > /dev/null 2>&1 ]
  cd +"$newdir"
}

function s()
{
  host $@ 2>&1 > /dev/null
  avail=`echo $?`
  server=`echo $@ | sed 's/\(\.[a-z]*\)\{2\}$//g'`
  if [ $avail -eq 0 ]; then screen -t $server ssh "$@"; fi
}

function del()
{
  echo -n "Input filename: "
  read f
  if [ -f "$f" ]; then find . -inum `ls -i $f | awk '{print $1}'` | xargs rm; fi
}

if [ `uname` = "FreeBSD" ]; then
  alias ls='ls -GF'
  alias ll='ls -alGF'
elif [ `uname` = "Darwin" ]; then
  alias ls='ls -GF'
  alias ll='ls -alGF'
  # Disable Ctrl-S reservation
  # @see http://dallarosa.tumblr.com/post/31333511717/commandt-and-ctrl-s-on-mac-os-x
  stty -ixon -ixoff
else
  alias ls='ls -F --color=auto'
  alias ll='ls -alF --color=auto'
  function say()
  {
    espeak "$1" --stdout | paplay
  }
fi

alias less='lv'
alias vi='vim'

precmd()
{
  [[ -t 1 ]] || return
  case $TERM in
    *xterm*|rxvt|(dt|k|E)term)
  print -Pn "\e]2;%n@%m:%~ \a"
  ;;
  screen)
  print -Pn "\e]0;%n@%m:%~ \a"
  ;;
  esac
}
