#  ____            _       ____             __ _ _      
# | __ )  __ _ ___| |__   |  _ \ _ __ ___  / _(_) | ___ 
# |  _ \ / _` / __| '_ \  | |_) | '__/ _ \| |_| | |/ _ \
# | |_) | (_| \__ \ | | | |  __/| | | (_) |  _| | |  __/
# |____/ \__,_|___/_| |_| |_|   |_|  \___/|_| |_|_|\___|
#


[[ -f ~/.bashrc ]] && . ~/.bashrc

# Add elements to PATH
export PATH="${PATH}:${HOME}/.local/bin:${HOME}/.local/share/cargo/bin"

# XDG Base Diretory specification
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_CONFIG_HOME="${HOME}/.config"

# XDG Environment Variables
export XDG_CURRENT_DESKTOP=sway


# Environment variables
export WM="sway"
export BROWSER="librewolf"
export EDITOR="nvim"
export READER="zathura"
export VISUAL="nvim"
export CODEEDITOR="vscodium"
export TERMINAL="kitty"
export COLORTERM="truecolor"
export TERM="xterm-kitty"
export SHELL="/bin/bash"
export PAGER="less"


# XDG Base Directory
export LESSHISTFILE="-" # Disable history
export HISTFILE="${XDG_DATA_HOME}/bash/history"
export CARGO_HOME="${XDG_DATA_HOME}/cargo"
export GRADLE_USER_HOME="${XDG_DATA_HOME}/gradle"
export GNUPGHOME="${XDG_DATA_HOME}/gnupg"
export W3M_DIR="${XDG_STATE_HOME}/w3m"
export WGETRC="${XDG_CONFIG_HOME}/wgetrc"
export PYTHONPYCACHEPREFIX="${XDG_CACHE_HOME}/python"
export PYTHONUSERBASE="${XDG_DATA_HOME}/python"
export GNUPGHOME="${XDG_DATA_HOME}/gnupg"
export RUSTUP_HOME="${XDG_DATA_HOME}/rustup"
export WINEPREFIX="${XDG_DATA_HOME}/wineprefixes/default"
export NUGET_PACKAGES="${XDG_CACHE_HOME}/NuGetPackages"
export IPYTHONDIR="${XDG_CONFIG_HOME}/jupyter"
export ICEAUTHORITY="${XDG_CACHE_HOME}/ICEAuthority"
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"
export ADB_VENDOR_KEYS="${XDG_DATA_HOME}/android"
export MINISIGN_CONFIG_DIR="${XDG_DATA_HOME}/minisign"

# XDG Base Directory aliases
alias monerod='monerod --data-dir "$XDG_DATA_HOME"/bitmonero'
alias irssi='irssi --config="$XDG_CONFIG_HOME"/irssi/config --home="$XDG_DATA_HOME"/irssi'


# Make Qt themes work
export QT_QPA_PLATFORMTHEME="qt5ct"

# Make stuff work with Wayland
export MOZ_ENABLE_WAYLAND=1	# Firefox

# Fix the Java reparenting issue
# And other Java stuff
export JAVA_HOME="/usr/lib/jvm/java-17-openjdk"
export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=${XDG_CONFIG_HOME}/java"


# Keyboard input method
export XMODIFIERS=@im=fcitx
export QT_IM_MODULE=fcitx
export GTK_IM_MODULE=fcitx 

