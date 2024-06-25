# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#PS1='[\u@\h \W]\$ '
PS1='\[\e[96m\]\u\[\e[0m\]@\[\e[96m\]\h\[\e[0m\] \[\e[97m\]\w/\n\[\e[30;107m\]૮ ⋅ﻌ⋅ა\[\e[0m\] \[\e[96m\]>\[\e[0m\] '

# Aliases
alias ls='ls -la --color=auto --sort=extension'
alias dd='dd noatime status=progress'
alias doas='sudo'
alias ..='cd ..'
alias xinstall='sudo xbps-install -Sy'
alias xquery='xbps-query -Rs'
alias xupdate='sudo xbps-install -Su'
alias xremove='sudo xbps-remove -R'
alias xinstalled='xbps-query -l'
alias systemctl='printf "You'\''re not using systemd, dumbass\nEnable with:  ln -s /etc/sv/<service> /var/service/\nDisable with: rm /var/service/<service>\nNot working:  " && echo '
alias alternatives='printf "Switch between different package versions with xbps-alternatives. Here'\''s an example with Java\nList package versions: xbps-alternatives -l -g java\nSet package version:   sudo xbps-alternatives -g java -s openjdk17-jre\n"'

# Prevent commands from entering bash history
export HISTIGNORE="encrypt*:decrypt*"

# Functions
function encrypt() {
	gpgtar --encrypt --symmetric --output ./$2 --gpg-args="--passphrase=$3 --batch" ./$1 
}
function decrypt () {
	gpgtar --decrypt --output ./$2 --gpg-args="--passphrase=$3 --batch" ./$1
}
