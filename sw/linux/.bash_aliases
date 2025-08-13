

/sbin/ifconfig eth0 172.16.220.97 netmask 255.255.255.0 
/sbin/route add default gw 172.16.220.1


################### Aliases ######################
alias ne='nedit '
alias c='clear '
alias d='pwd '
alias d-='pwd - '
alias h='history '
alias o='nano '
alias rm='rm -i'
alias mv='mv -i'
alias py='python3 '

alias ls='ls --color=auto -alF'
alias ll='ls -lah'
alias la='ls -A'



alias ..='cd ..'
alias cd..='cd ..'
alias cd-='cd -'
alias l='ls -ltra --block-size=M'
alias findlatest='find ./ -type f -print0 | xargs -0 ls -lt | head -n 1'


