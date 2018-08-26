export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/sqlite/bin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"

# Local bin directories before anything else
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="/usr/bin:/bin:$PATH"
export PATH="/usr/sbin:/sbin:$PATH"

# Load custom commands
export PATH="$DOTFILES/src/bin:$PATH"
