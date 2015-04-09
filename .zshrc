export ZSH=$HOME/github/heim/ZSH
hst=$(hostname -s)

if [ "$hst" = helios ] ; then
   ZSH_THEME="norm"
elif [ "$hst" = toybox ] ; then
   ZSH_THEME="candy-kingdom"
elif [ "$hst" = saturn ] ; then
    ZSH_THEME="fox"
elif [ "$hst" = aurora ] ; then
    ZSH_THEME="pygmalion"
else
    ZSH_THEME="kphoen"
fi

#jupiter theme
#ZSH_THEME="kphoen"

plugins=(git docker debian zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

ZSH_HIGHLIGHT_STYLES[cursor]='bg=blue'

typeset -A key

key[Home]=${terminfo[khome]}

key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history

if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        printf '%s' "${terminfo[smkx]}"
    }
    function zle-line-finish () {
        printf '%s' "${terminfo[rmkx]}"
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi

export PATH="$PATH:$HOME/.rvm/gems/ruby-2.0.0-p598/bin:$HOME/heim/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

source $ZSH/custom/functions.zsh

if [ -d "/usr/local/nvm" ] ; then
   export NVM_DIR="/usr/local/nvm"
   [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
fi

if [ -d "$HOME/.nvm" ] ; then
   export NVM_DIR="$PATH:$HOME/.nvm"
   [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
 fi

if [ -d "$HOME/bin" ] ; then
   export PATH="$HOME/bin:$PATH"
fi

unset GREP_OPTIONS

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
if [ -n "$FINALTERMSCRIPT" ]; then
    . $FINALTERMSCRIPT
fi


if [ "$hst" = helios ] ; then
   source $ZSH/custom/exports.zsh
   source $ZSH/custom/helios_exports.zsh
elif [ "$hst" = toybox ] ; then
   source $ZSH/custom/exports.zsh
elif [ "$hst" = saturn ] ; then
   source $ZSH/custom/exports.zsh
fi
h=`date +%H`

if [ $h -lt 12 ]
  then
	echo "Good morning `whoami`"
elif [ $h -lt 18 ]
  then
	echo "Good afternoon `whoami`"
else
	echo "Good evening `whoami`"
fi

