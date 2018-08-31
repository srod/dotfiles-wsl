export PATH="/usr/bin:/bin:$PATH"
export PATH="/usr/sbin:/sbin:$PATH"

export PATH="/usr/local/opt/sqlite/bin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

# Load custom commands
export PATH="$DOTFILES/src/bin:$PATH"

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
