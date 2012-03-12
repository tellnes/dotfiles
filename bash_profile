
. ~/.profile

export EDITOR='vim'

export PS1="\[\e[0;33m\]\u\[\e[m\]\e[0;31m@\e[0;36m\`if [ \$NAME ]; then echo -e $NAME; else echo -e $HOSTNAME; fi\` \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]"
