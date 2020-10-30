
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

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

if [ "$(command -v bat)" ]; then
  unalias -m 'cat'
  alias cat='bat -pp --theme="Nord"'
fi

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
