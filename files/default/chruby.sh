[ -n "$BASH_VERSION" ] || [ -n "$ZSH_VERSION" ] || return

source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
chruby ruby-2.0.0-p0
