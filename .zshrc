# Path to your oh-my-zsh installation.
export ZSH=/Users/Matias/.oh-my-zsh

# Theme
ZSH_THEME="kriox26"

plugins=(git)

# User configuration

export PATH=$PATH:"/Users/Matias/.rvm/gems/ruby-2.2.0/bin:/Users/Matias/.rvm/gems/ruby-2.2.0@global/bin:/Users/Matias/.rvm/rubies/ruby-2.2.0/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:/Users/Matias/.rvm/bin"
 export MANPATH="/usr/local/man:$MANPATH"
export GOPATH=$HOME/Documents/GoProjects
export PATH=$PATH:$GOPATH/bin
export PATH="/usr/local/sbin:$PATH"

export EDITOR="nvim"
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

#Basic alias
	alias gtg='brew update && brew upgrade && brew cleanup'
  alias lg='/bin/zsh --login'
	alias vimbp='vim ~/.bash_profile' #For faster openning of .bash_profile
	alias sbp='source ~/.bash_profile' #For faster sourcing
	alias sz='source ~/.zshrc'
	alias vimrc='vim ~/.vimrc'	#convenient way for open .vimrc
	alias vimgc='vim ~/.gitconfig' #vimgc: open .gitconfig
	alias vimz='vim ~/.zshrc'
	alias c='clear' #I'm lazy, so what...
	alias e='exit'
	alias o='open'
	alias o1='open .'
	alias v='vim'
	alias n='nvim'
	alias nvimrc='nvim ~/.nvimrc'
	alias nvimz='nvim ~/.zshrc'
	alias ls='ls -G'  #Displays a list of dirs and files with colors
	alias la='ls -Ga' #Displays all hidden files and reg files with la
	alias lf='ls -GFlash' #Displays hidden and reg files with usefull info
	alias del='rmtrash'
	alias trash='rmtrash' #del / trash are shorter than rmtrash
	alias starwars='telnet towel.blinkenlights.nl'
	alias changelog='sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText'
	alias resetlog='sudo defaults delete /Library/Preferences/com.apple.loginwindow'
	alias msqlstart='sudo /usr/local/Cellar/mysql/5.6.25/support-files/mysql.server start'

#Brew
	alias bupd='sudo brew update'  			#bupd = brew update
	alias bdtr='brew doctor'				#bdtr = brew doctor

#For developing
	alias irbs='irb --simple-prompt'
	alias irbsc='irb --simple-prompt -rrbconfig'
	alias rspec='rspec --format doc'

#Networking
	alias myip='curl ip.appspot.com' 		#myip: public facing IP address
	alias netCons='lsof -i'			 		#netCons: show all TCP/IP sockets
	alias ipInfo0='ipconfig getpacket en0'	#ipInfo0: Get info on connections for en0
	alias ipInfo1='ipconfig getpacket en1'	#ipInfo1: Get info on connections for en1
	alias openPorts='sudo lsof -i | grep LISTEN'	#openPorts: All listening connections
	alias unloadlaunchctl='sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.discoveryd.plist'
	alias loadlaunchctl='sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.discoveryd.plist'

#Some for git
	alias gstatus='git status'
	alias gpush='git push -u origin master'
	alias gdiff='git diff'

#tmux
	alias tmuxa='tmux attach -t'
	alias tmuxk='tmux kill-session -t'
	alias tls='tmux ls'
	alias tns='tmux new-session'

#tmuxinator
	alias tmxn='tmuxinator new'
	alias tmxo='tmuxinator open'
	alias tmxs='tmuxinator start'
	alias tmxls='tmuxinator list'
	alias tmxd='tmuxinator doctor'
	alias tmxv='tmuxinator version'

#hub
	alias git=hub

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Load zsh-syntax-highlighting.
# source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Load zsh-autosuggestions.
# source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/autosuggestions.zsh

# Enable autosuggestions automatically.
# zle-line-init() {
    # zle autosuggest-start
# }
# zle -N zle-line-init
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
