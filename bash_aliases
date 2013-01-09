
alias reload='. ~/.bash_profile'

alias ..='cd ..'

# textmate
alias m='mate'

# git
alias g='git'

# closure compiler
alias closure='java -jar ~/.dotfiles/support/closure-compiler/compiler.jar'

# short - remove long lines from input
alias short="awk '{if (length() > 255) getline ; else print}'"


function mcd() { mkdir $1 && cd $1; }
