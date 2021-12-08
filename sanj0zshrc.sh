eval $(thefuck --alias)
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-14.0.2.jdk/Contents/Home
export PATH=$PATH:~/anaconda3/bin:~/v:$HOME/go/bin
export EDITOR=vim
export ICLOUD=~/Library/Mobile\ Documents/com~apple~CloudDocs/
alias desktopicons='desktopIcons'
alias icons='desktopIcons'
alias firefox='open -a Firefox'
alias vscode="open -a 'Visual Studio Code' $@"
alias cjava='find . -name "*.java" | xargs wc -l'
alias clines='find . -type f -print0 | xargs -0 wc -l'
alias please='sudo'
alias finder='open .'
# make sure the file exists because bc will not start when it doesn't exist
touch ~/.bcrc.bc
alias bc='bc -l ~/.bcrc.bc'
alias j='jbsn'

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
