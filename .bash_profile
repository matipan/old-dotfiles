#Maintainer: Matias Pan - https://github.com/kriox26

#Main configs
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#Usefull alias
alias vimbp='vim ~/.bash_profile' #For faster openning of .bash_profile
alias sbp='source ~/.bash_profile' #For faster sourcing 
alias vimrc='vim ~/.vimrc'	#convenient way for open .vimrc
alias c='clear' #I'm lazy, so what...
alias ls='ls -G' # Displays the list of dir and files with colors
alias la='ls -Ga' #Displays all hidden files and reg files with la

#Networking
alias myip='curl ip.appspot.com' 		#myip: public facing IP address
alias netCons='lsof -i'			 		#netCons: show all TCP/IP sockets
alias ipInfo0='ipconfig getpacket en0'	#ipInfo0: Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'	#ipInfo1: Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'	#openPorts: All listening connections

#Git configs
alias gadd='git add'
alias gstatus='git status'
alias gcommit='git commit -m'
alias glog='git log'
alias gpush='git push -u origin master'
