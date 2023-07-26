#  ____            _              
# | __ )  __ _ ___| |__  _ __ ___ 
# |  _ \ / _` / __| '_ \| '__/ __|
# | |_) | (_| \__ \ | | | | | (__ 
# |____/ \__,_|___/_| |_|_|  \___|
#


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Import aliases
[[ -f ~/.config/aliasrc ]] && source ~/.config/aliasrc

# Disable ctrl-s and ctrl-q.
stty -ixon

# Fix GPG
export GPG_TTY=$(tty)

# Configure completion for doas
# -c : Complete arguments as if they were commands
#     (eg: `doas emer<tab>` -> `doas emerge`)
#     (eg: `doas dd status=p<tab>` -> `doas dd status=progress`)
# -f : Complete arguments as if they were directory names (default behaviour)
#     (eg: `doas /bi<tab>` -> `doas /bin/`)
complete -cf doas

# I hate Cantv with all my heart
alias cantv='until ping -c1 gentoo.org; do continue; done; printf "\a"'

# Starship prompt
eval "$(starship init bash)"

