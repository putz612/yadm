# What OS are we really on
unameOut="$(uname -s)"
arch="$(uname -p)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac

# https://github.com/ansible/ansible/issues/49207
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES




# starship is not a spaceship
# https://starship.rs/
eval "$(starship init zsh)"

# I need my things
export PATH="$PATH:$HOME/.local/bin" 


# neovim ftw
# https://github.com/neovim/neovim
if [ "$(command -v nvim)" ]; then
  alias vim="nvim"
  alias vi="nvim"
fi

# exa is the new hot ls
# https://the.exa.website/
if [ "$(command -v exa)" ]; then
  unalias -m 'll'
  unalias -m 'l'
  unalias -m 'la'
  unalias -m 'ls'
  alias ls='exa -G  --color auto --icons -a -s type'
  alias ll='exa -l --color always --icons -a -s type'
fi

# for the Rancher Desktop things
# https://github.com/rancher-sandbox/rancher-desktop/
RD="$HOME/.rd/bin"
if [ -d "$RD" ]; then
  export PATH="$PATH:$HOME/.rd/bin"
fi

# Krew plugin for kubectl
export PATH="${PATH}:${HOME}/.krew/bin"

# Bat is more better than cat
# https://github.com/sharkdp/bat
if [ "$(command -v bat)" ]; then
  unalias -m 'cat'
  alias cat='bat -pp --theme="Nord"'
fi

if [[ "$machine" == 'Mac' ]]; then
  # https://github.com/NixOS/nix/issues/3616#issuecomment-1495570532
  if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
    source '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
  fi
  if [[ "$arch" == "i386" ]]; then
    source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters
    source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
  elif [[ "$arch" == "arm" ]]; then
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters
    source /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh
    source /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
    source /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
  fi
    export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
    export PATH="$PATH:$HOME/Library/Python/3.9/bin"
    export PATH="$PATH:$HOME/.bin"
fi

if [[ "$machine" == 'Linux' ]]; then

fi

