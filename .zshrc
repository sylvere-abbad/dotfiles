export TERM="xterm-256color"
export LANG=en_US.UTF-8
export GOPATH=~/Workspaces/golang # don't forget to change your path correctly!
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:/usr/local/sbin:.:$PATH"
export PATH="$PATH:$HOME/.composer/vendor/bin"
export DEFAULT_USER=chill

ANTIGEN_BUNDLES=~/.antigen/bundles
source ~/.powerlevel9k.zsh
source /usr/local/share/antigen/antigen.zsh
antigen init ~/.antigenrc

fpath=(/usr/local/share/zsh-completions $fpath)

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

alias ls='colorls -rA --sd'
alias ll='ls -l'
alias l='colorls'
alias lgs='ls --gs -t'
alias cat='ccat'
alias chrome="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"
alias chrome-headless="chrome --headless --disable-gpu"
alias chrome-headless-debug="chrome --headless --disable-gpu --remote-debugging-port=9090"
alias dk=docker
alias kb=kubectl
alias dkc=docker-compose
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/chill/.sdkman"
[[ -s "/Users/chill/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/chill/.sdkman/bin/sdkman-init.sh"

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
