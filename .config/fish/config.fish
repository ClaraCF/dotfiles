#  _____ _     _        ____             __ _       
# |  ___(_)___| |__    / ___|___  _ __  / _(_) __ _ 
# | |_  | / __| '_ \  | |   / _ \| '_ \| |_| |/ _` |
# |  _| | \__ \ | | | | |__| (_) | | | |  _| | (_| |
# |_|   |_|___/_| |_|  \____\___/|_| |_|_| |_|\__, |
#                                             |___/ 

function ucabobo
    switch "$argv[1]"
    case "nextdns"
        doas ln -sf /etc/systemd/dns_servers/nextdns_servers.conf /etc/systemd/resolved.conf.d/dns_servers.conf
        and doas systemctl restart systemd-resolved.service
        and echo "DNS Servers switched to NextDNS"
        and echo "  - DNSOverTLS: ON"
        and echo "  - DNSSEC: ON"

    case "quad9"
        doas ln -sf /etc/systemd/dns_servers/quad9_servers.conf /etc/systemd/resolved.conf.d/dns_servers.conf
        and doas systemctl restart systemd-resolved.service
        and echo "DNS Servers switched to Quad9"
        and echo "  - DNSOverTLS: ON"
        and echo "  - DNSSEC: ON"
    case "cloudflare"
        doas ln -sf /etc/systemd/dns_servers/cloudflare_servers.conf /etc/systemd/resolved.conf.d/dns_servers.conf
        and doas systemctl restart systemd-resolved.service
        and echo "DNS Servers switched to Cloudflare"
        and echo "  - DNSOverTLS: ON"
        and echo "  - DNSSEC: ON"
    case "ucab"
        doas ln -sf /etc/systemd/dns_servers/quad9_servers_ucab.conf /etc/systemd/resolved.conf.d/dns_servers.conf
        and doas systemctl restart systemd-resolved.service
        and echo "DNS Servers switched to Quad9 (UCAB)"
        and echo "  - DNSOverTLS: ON"
        and echo "  - DNSSEC: OFF!!!"
    case "cantv"
        doas ln -sf /etc/systemd/dns_servers/cantv_servers.conf /etc/systemd/resolved.conf.d/dns_servers.conf
        and doas systemctl restart systemd-resolved.service
        and echo "DNS Servers switched to Can'tv (!!!)"
        and echo "  - DNSOverTLS: OFF!!!"
        and echo "  - DNSSEC: OFF!!!"
    case "*"
        echo "Invalid profile -- '$argv[1]'"
        and echo "Valid profiles are:"
        and echo "- nextdns"
        and echo "- quad9"
        and echo "- cloudfare"
        and echo "- ucab"
    end
end 

function cpu-performance
    doas ryzenadj -a9999999999999999999 -b9999999999999999999 --max-performance
end

function cpu-powersave
    doas ryzenadj -a0 -b0 --power-saving
end

function git-profile
    set -f PROFILE
    set -f NAME
    set -f EMAIL
    set -f GPG_SIGN
    set -f valid "true"

    switch "$argv[1]"
        case "github"
            set -f PROFILE "Personal GitHub"
            set -f NAME "ClaraCF"
            set -f EMAIL "78223334+ClaraCF@users.noreply.github.com"
            set -f GPG_SIGN "true"

        case "ucab"
            set -f PROFILE "UCAB GitHub"
            set -f NAME "ClaraUCAB"
            set -f EMAIL "146204299+ClaraUCAB@users.noreply.github.com"
            set -f GPG_SIGN "false"


        case "gitlab"
            set -f PROFILE "Personal GitLab"
            set -f NAME "Clara"
            set -f EMAIL "4782822-ClaraCF@users.noreply.gitlab.com"
            set -f GPG_SIGN "false"


        case "codeberg"
            set -f PROFILE "Personal Codeberg"
            set -f NAME "Clara"
            set -f EMAIL "clarilu@noreply.codeberg.org"
            set -f GPG_SIGN "false"

        case "*"
            echo "Available profiles: github, ucab, gitlab, codeberg."
            set -f valid "false"
    end

    if test "$valid" = "true"
        echo "Setting profile to '$PROFILE'."
        echo "Name: $NAME"
        echo "Email: $EMAIL"
        echo "GPG Sign: $GPG_SIGN"

        git config --local user.name "$NAME"
        git config --local user.email "$EMAIL"
        git config --local author.name "$NAME"
        git config --local author.email "$EMAIL"
        git config --local commit.gpgSign "$GPG_SIGN"
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

    # Arduino completion
    source (arduino-cli completion fish | psub)

    # Use starship prompt
    source (/usr/bin/starship init fish --print-full-init | psub)
end

