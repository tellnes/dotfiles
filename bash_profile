
# All the PATH thing should go here

export PATH="$HOME/.n/current/bin:${PATH}"

export PATH="$HOME/bin:$HOME/usr/bin:${PATH}"


# end PATH



export EDITOR='mate -w'

[ -f ~/.bash_node ] && . ~/.bash_node

[ -f ~/.bashrc ] && . ~/.bashrc

[ -f ~/.bash_custom ] && . ~/.bash_custom


source ~/.git-completion.bash


# {{{
# Node Completion - Auto-generated, do not touch.
shopt -s progcomp
for f in $(command ls ~/.node-completion); do
  f="$HOME/.node-completion/$f"
  test -f "$f" && . "$f"
done
# }}}
