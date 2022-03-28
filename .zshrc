
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

bindkey -v

if [ "$(command -v docker)" ]; then
  alias tldr='docker run --rm -it -v ~/.tldr/:/root/.tldr/ nutellinoit/tldr'
fi

if [ "$(command -v exa)" ]; then
  unalias -m 'll'
  unalias -m 'l'
  unalias -m 'la'
  unalias -m 'ls'
  alias ls='exa -G  --color auto --icons -a -s type'
  alias ll='exa -l --color always --icons -a -s type'
fi

KREW="$HOME/.krew/bin"
if [ -f "$KREW" ]; then
    export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
fi


if [ "$(command -v bat)" ]; then
  unalias -m 'cat'
  alias cat='bat -pp --theme="Nord"'
fi


export DENO_INSTALL="/home/jason/.deno"


if [ -d "$DENO_INSTALL" ]; then
  export PATH="$DENO_INSTALL/bin:$PATH"
  fpath=(~/.zsh $fpath)
  autoload -Uz compinit
  compinit -u
fi


if [ "$(command -v exa)" ]; then
  eval "$(zoxide init zsh)"
fi

eval "$(starship init zsh)"

export SPICETIFY_INSTALL="/home/jason/.spicetify"
if [ -d "$SPICETIFY_INSTALL" ]; then
  export PATH="$PATH:$HOME/.spicetify"
fi

