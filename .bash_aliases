# some more ls aliases
alias ll='ls -ahlF'
alias lt='ls -lrthFa'
alias la='ls -A'
alias l='ls -CF'

# handy short cuts
alias h='history'
alias j='jobs -l'
alias gh='history | grep'
alias path='echo -e ${PATH//:/\\n}'

# copy using rsync and show progress bar and resume files
alias cpv='rsync -zavhP --info=progress2'

# quick way to get out of current dir
alias cd..='cd ..'
alias cd...='cd ../../../'
alias cd....='cd ../../../../'
alias cd.....='cd ../../../../../'
alias cd.4='cd ../../../../'
alias cd.5='cd ../../../../../'

# make mount command output pretty and human readable format
alias mountt='mount |column -t'

# pass options to free
alias meminfo='free -h -l -t'

# get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

# get top process eating cpu
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

# get server cpu info
alias cpuinfo='lscpu'

# ps command pass string to look for it in the process table
alias psg='ps -Helf | grep -v $$ | grep -i -e WCHAN -e '

# time and date related short cuts
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

