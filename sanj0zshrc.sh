# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="clean" # set by `omz`

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git you-should-use macos zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

eval $(thefuck --alias)
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-14.0.2.jdk/Contents/Home
export PATH=$PATH:~/anaconda3/bin:~/v:$HOME/go/bin
export EDITOR=vim
export ICLOUD=~/Library/Mobile\ Documents/com~apple~CloudDocs/
export PF_INFO="ascii os shell editor palette kernel memory"

alias desktopicons='desktopIcons'
alias icons='desktopIcons'
alias firefox='open -a Firefox'
alias vscode="open -a 'Visual Studio Code' $@"
alias cjava='find . -name "*.java" | xargs wc -l'
alias clines='find . -type f -print0 | xargs -0 wc -l'
alias please='sudo'
alias finder='open .'
alias :q='exit'
alias i3config='vim ~/.config/i3/config'
alias apple-superdrive="sudo sg_raw /dev/sr0 EA 00 00 00 00 00 01"
# make sure the file exists because bc will not start when it doesn't exist
if [ ! -e ~/.bcrc.bc ]; then
	touch ~/.bcrc.bc
fi
alias bc='bc -l ~/.bcrc.bc'

# actives or deactivates the icons on the desktop
# usage: desktopIcons [true/false]
function desktopIcons {
	defaults write com.apple.finder CreateDesktop $1
	killall Finder
}

# toggles visibility of hidden files within Finder
# usage: toggleHidden [true/false]
function showHidden {
    defaults write com.apple.Finder AppleShowAllFiles $1
    killall Finder
}
# separates an audio file into vocals and rest
# only works with spleeter installed in PATH (duh)
# usage: separate INPUT OUTPUT
function separate {
	spleeter separate -i $1 -p spleeter:2stems -o $2
}

