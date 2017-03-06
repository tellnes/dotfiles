
alias reload='. ~/.bash_profile'

alias ..='cd ..'

# git
alias g='git'

# short - remove long lines from input
alias short="awk '{if (length() > 255) getline ; else print}'"

function mcd() { mkdir $1 && cd $1; }

function cgd() {
  ls -1 | while read dir; do if [ -d $dir/.git ] ; then echo $dir; git --git-dir=$dir/.git describe --all; echo; fi done
}

