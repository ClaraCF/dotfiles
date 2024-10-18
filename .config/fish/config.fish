#  _____ _     _        ____             __ _       
# |  ___(_)___| |__    / ___|___  _ __  / _(_) __ _ 
# | |_  | / __| '_ \  | |   / _ \| '_ \| |_| |/ _` |
# |  _| | \__ \ | | | | |__| (_) | | | |  _| | (_| |
# |_|   |_|___/_| |_|  \____\___/|_| |_|_| |_|\__, |
#                                             |___/ 

function ucabobo
    switch "$argv[1]"
    case "on"
        doas ln -sf /etc/systemd/ucab_resolved.conf /etc/systemd/resolved.conf
        and doas systemctl restart systemd-resolved.service
        and echo "Modo ucabobo: ACTIVADO"

    case "off"
        doas ln -sf /etc/systemd/clara_resolved.conf /etc/systemd/resolved.conf
        and doas systemctl restart systemd-resolved.service
        and echo "Modo ucabobo: DESACTIVADO"

    case "*"
        echo "Opción inválida"
    end
end 


if status is-interactive
    # Disable greeting
    set -x fish_greeting

    # Import aliases
    test -f ~/.config/aliasrc && source ~/.config/aliasrc

    # Disable ctrl-s and ctrl-q.
    stty -ixon

    # Fix GPG
    set -x GPG_TTY (tty)

    # I hate Cantv with all my heart
    alias cantv='until ping -c1 gentoo.org; do continue; done; printf "\a"'

    # Enable support for truecolor
    set -x fish_term24bit 1
    set -x COLORTERM truecolor
    set -x TERM xterm-kitty

    # Use starship prompt
    source (/usr/bin/starship init fish --print-full-init | psub)
end

