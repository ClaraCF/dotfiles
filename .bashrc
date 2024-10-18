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

# Modo UCABobo
function ucabobo() {
    # if [ $(id -u) -ne 0 ]
    # then
    #     echo "[!] Must be run as root."
    #     return 1
    # fi

    export ACTION="$1"

    doas id 2>&1 > /dev/null

    if [ "${ACTION}" == "on" ]
    then
        doas sed -i s'/^nameserver ::1/#&/' /etc/resolv.conf
        doas sed -i s'/^nameserver 127.0.0.1/#&/' /etc/resolv.conf
        doas sed -i s'/^#nameserver 9.9.9.9/nameserver 9.9.9.9/' /etc/resolv.conf
        echo "Modo UCABobo: ACTIVADO"
        return 0
    elif [ "${ACTION}" == "off" ]
    then
        echo "Modo UCABobo: DESACTIVADO"
        doas sed -i s'/^nameserver 9.9.9.9/#&/' /etc/resolv.conf
        doas sed -i s'/^#nameserver ::1/nameserver ::1/' /etc/resolv.conf
        doas sed -i s'/^#nameserver 127.0.0.1/nameserver 127.0.0.1/' /etc/resolv.conf
        return 0
    else
        echo "[!] Invalid mode -- '${ACTION}'"
        return 1
    fi
}

# Use fish in place of bash
# keep this line at the bottom of ~/.bashrc
[ -x /bin/fish ] && [ -z "$IN_NIX_SHELL" ] && SHELL=/bin/fish exec fish

# Starship prompt
#eval "$(starship init bash)"

