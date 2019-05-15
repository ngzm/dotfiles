if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi

# SET PROMPT
export PS1='\[\e[36m\]\u@\h:\w\[\e[32m\] \D{%y/%m/%d %H:%M:%S}\[\e[33m\] #\# \[\e[0m\]\n$ '
