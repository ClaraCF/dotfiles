#  _____ _     _       ____             __ _ _      
# |  ___(_)___| |__   |  _ \ _ __ ___  / _(_) | ___ 
# | |_  | / __| '_ \  | |_) | '__/ _ \| |_| | |/ _ \
# |  _| | \__ \ | | | |  __/| | | (_) |  _| | |  __/
# |_|   |_|___/_| |_| |_|   |_|  \___/|_| |_|_|\___|

# Add elements to PATH
set -x PATH "$PATH:$HOME/.local/bin:$HOME/.local/share/cargo/bin:$JAVA_HOME/bin"

# XDG Base Diretory specification
set -x XDG_DATA_HOME "$HOME/.local/share"
set -x XDG_CACHE_HOME "$HOME/.cache"
set -x XDG_CONFIG_HOME "$HOME/.config"

# XDG Environment Variables
set -x XDG_CURRENT_DESKTOP sway


# Environment variables
set -x WM "sway"
set -x BROWSER "librewolf"
set -x EDITOR "nvim"
set -x READER "zathura"
set -x VISUAL "nvim"
set -x CODEEDITOR "vscodium"
set -x TERMINAL "kitty"
set -x COLORTERM "truecolor"
set -x TERM "xterm-kitty"
set -x SHELL "/bin/bash"
set -x PAGER "less"


# XDG Base Directory
set -x LESSHISTFILE "-" # Disable history
#set -x HISTFILE "$XDG_DATA_HOME/bash/history"
set -x CARGO_HOME "$XDG_DATA_HOME/cargo"
set -x GRADLE_USER_HOME "$XDG_DATA_HOME/gradle"
set -x GNUPGHOME "$XDG_DATA_HOME/gnupg"
set -x _JAVA_OPTIONS "-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"
set -x W3M_DIR "$XDG_STATE_HOME/w3m"
set -x WGETRC "$XDG_CONFIG_HOME/wgetrc"
set -x PYTHONPYCACHEPREFIX "$XDG_CACHE_HOME/python"
set -x PYTHONUSERBASE "$XDG_DATA_HOME/python"
set -x GNUPGHOME "$XDG_DATA_HOME/gnupg"
set -x RUSTUP_HOME "$XDG_DATA_HOME/rustup"
set -x WINEPREFIX "$XDG_DATA_HOME/wineprefixes/default"
set -x NUGET_PACKAGES "$XDG_CACHE_HOME/NuGetPackages"
set -x IPYTHONDIR "$XDG_CONFIG_HOME/jupyter"
set -x ICEAUTHORITY "$XDG_CACHE_HOME/ICEAuthority"
set -x NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME/npm/npmrc"
set -x ADB_VENDOR_KEYS "$XDG_DATA_HOME/android"
set -x MINISIGN_CONFIG_DIR "$XDG_DATA_HOME/minisign"

# XDG Base Directory aliases
alias monerod "monerod --data-dir '$XDG_DATA_HOME/bitmonero'"
alias irssi "irssi --config '$XDG_CONFIG_HOME/irssi/config' --home '$XDG_DATA_HOME/irssi'"


# Make Qt themes work
set -x QT_QPA_PLATFORMTHEME "qt5ct"

# Make stuff work with Wayland
set -x MOZ_ENABLE_WAYLAND 1	# Firefox

# Fix the Java reparenting issue
set -x _JAVA_AWT_WM_NONREPARENTING 1
set -x JAVA_HOME "/usr/lib/jvm/openjdk-bin-17"


# Keyboard input method
set -x XMODIFIERS @im fcitx
set -x QT_IM_MODULE fcitx
set -x GTK_IM_MODULE fcitx 

