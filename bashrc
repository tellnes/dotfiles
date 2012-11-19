
# if not running interactively, don't do anything
[ -z "$PS1" ] && return

export CLICOLOR=true

. ~/.bash_aliases

export EDITOR='vim'


PROMPT_COMMAND='DIR=`pwd|sed -e "s!$HOME!~!"`; if [ ${#DIR} -gt 30 ]; then CurDir=${DIR:0:12}...${DIR:${#DIR}-15}; else CurDir=$DIR; fi'

export PS1="\[\e[0;36m\]\u\[\e[0;31m\]@\[\e[0;33m\]\h \[\e[0;34m\]\$CurDir \[\e[0;32m\]\$ \[\e[0m\]"
