#export JAVA_HOME=`/usr/libexec/java_home -v 1.9.0_181`
#export JAVA_HOME=`/usr/libexec/java_home -v 1.8.0_144`
#export JAVA_HOME=`/usr/libexec/java_home -v 1.6.0_65-b14-468`

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export EDITOR='Code'
export HOMEBREW_NO_ANALYTICS=1

export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"
