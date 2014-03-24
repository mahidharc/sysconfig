#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# alias ls='ls --color=auto'
# PS1='[\u@\h \W]\$ '
PS1='\[\e[0;31m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]\$ \[\e[m\]\[\e[0;32m\] '

## Modified commands ## {{{
alias diff='colordiff'              # requires colordiff package
alias grep='grep --color=auto'
alias more='less'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias nano='nano -w'
# alias ping='ping -c 5'
alias dmesg='dmesg -HL'
alias alsaequal='alsamixer -D equal'
# }}}

## New commands ## {{{
alias da='date "+%A, %B %d, %Y [%T]"'
alias du1='du --max-depth=1'
alias hist='history | grep'         # requires an argument
alias openports='ss --all --numeric --processes --ipv4 --ipv6'
alias pgg='ps -Af | grep'           # requires an argument
alias ..='cd ..'
# }}}

# Privileged access
if [ $UID -ne 0 ]; then
    alias sudo='sudo '
    alias scat='sudo cat'
    alias svim='sudoedit'
    alias root='sudo -s'
    alias reboot='sudo systemctl reboot'
    alias poweroff='sudo systemctl poweroff'
    alias update='sudo pacman -Su'
    alias netctl='sudo netctl'
fi

## ls ## {{{
alias ls='ls -hF --color=auto'
alias lr='ls -R'                    # recursive ls
alias ll='ls -l'
alias la='ll -A'
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias lm='la | more'
# }}}

## Safety features ## {{{
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'                    # 'rm -i' prompts for every file
# safer alternative w/ timeout, not stored in history
alias rm=' timeout 3 rm -Iv --one-file-system'
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias clear=' echo -ne "\033c"'       # clear screen for real (it does not work in Terminology)
# }}}

## Make Bash error tolerant ## {{{
alias :q=' exit'
alias :Q=' exit'
alias :x=' exit'
alias cd..='cd ..'
# }}}

## Pacman aliases ## {{{
#if necessary, replace 'pacman' with your favorite AUR helper and adapt the commands accordingly
alias pac="sudo /usr/bin/pacman -S"             # default action        - install one or more packages
alias pacu="sudo /usr/bin/pacman -Syyu"         # '[u]pdate'            - upgrade all packages to their newest version
alias pacr="sudo /usr/bin/pacman -Rs"           # '[r]emove'            - uninstall one or more packages
alias pacs="/usr/bin/pacman -Ss"                # '[s]earch'            - search for a package using one or more keywords
alias paci="/usr/bin/pacman -Si"                # '[i]nfo'              - show information about a package
alias paclo="/usr/bin/pacman -Qdt"              # '[l]ist [o]rphans'    - list all packages which are orphaned
alias pacc="sudo /usr/bin/pacman -Scc"          # '[c]lean cache'       - delete all not currently installed package files
alias paclf="/usr/bin/pacman -Ql"               # '[l]ist [f]iles'      - list all files installed by a given package
alias pacexpl="/usr/bin/pacman -D --asexp"      # 'mark as [expl]icit'  - mark one or more packages as explicitly installed 
alias pacimpl="/usr/bin/pacman -D --asdep"      # 'mark as [impl]icit'  - mark one or more packages as non explicitly installed

## yaourt aliases ## {{{
#if necessary, replace 'yaourt' with your favorite AUR helper and adapt the commands accordingly
alias yao="/usr/bin/yaourt -S"               # default action        - install one or more packages
alias yaou="/usr/bin/yaourt -Syyua"          # '[u]pdate'            - upgrade all packages to their newest version
alias yaor="/usr/bin/yaourt -Rs"             # '[r]emove'            - uninstall one or more packages
alias yaos="/usr/bin/yaourt -Ss"             # '[s]earch'            - search for a package using one or more keywords
alias yaoi="/usr/bin/yaourt -Si"             # '[i]nfo'              - show information about a package
alias yaolo="/usr/bin/yaourt -Qdt"           # '[l]ist [o]rphans'    - list all packages which are orphaned
alias yaoc="/usr/bin/yaourt -Scc"            # '[c]lean cache'       - delete all not currently installed package files
alias yaolf="/usr/bin/yaourt -Ql"            # '[l]ist [f]iles'      - list all files installed by a given package
alias yaoexpl="/usr/bin/yaourt -D --asexp"   # 'mark as [expl]icit'  - mark one or more packages as explicitly installed 
alias yaoimpl="/usr/bin/yaourt -D --asdep"   # 'mark as [impl]icit'  - mark one or more packages as non explicitly installed

# '[r]emove [o]rphans' - recursively remove ALL orphaned packages
alias pacro="/usr/bin/pacman -Qtdq > /dev/null && sudo /usr/bin/pacman -Rs \$(/usr/bin/pacman -Qtdq | sed -e ':a;N;$!ba;s/\n/ 
/g')"
# }}}

# cd and ls in one
cl() {
    if [[ -d "$1" ]]; then
        cd "$1"
        ls
    else
        echo "bash: cl: '$1': Directory not found"
    fi
}

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

shopt -s autocd
