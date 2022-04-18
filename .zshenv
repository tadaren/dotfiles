#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

### add GOPATH
export GOPATH=$HOME/golang
export PATH=$GOPATH/bin:$PATH
### end add GOPATH

### add user script PATH
export PATH=~/bin:$PATH
### end add user script PATH

### set env
export LC_TIME="en-US.UTF-8"
###
### set env for rust
if [ -e $HOME/.cargo/env ]; then
    source $HOME/.cargo/env
fi
### end set env for rust
export PATH="/usr/local/opt/openssl/bin:$PATH"
