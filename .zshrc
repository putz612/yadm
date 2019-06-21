
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

ADOTDIR=$HOME/.antigen
# Download and install antigen if it doesn't exist
if [ ! -f "$ADOTDIR/antigen/antigen.zsh" ]; then
	echo "zsh antigen not installed - cloning..."
	mkdir -p "$ADOTDIR"
	git clone https://github.com/zsh-users/antigen "$ADOTDIR/antigen"
fi

# Install antigen plugins
source "$ADOTDIR/antigen/antigen.zsh"
    
# Load the oh-my-zsh's library
antigen use oh-my-zsh
antigen bundle <<EOBUNDLES
	# Bundles from the default repo (robbyrussell's oh-my-zsh)
	git

	# Syntax highlighting bundle.
	zsh-users/zsh-syntax-highlighting

	# Fish-like auto suggestions
	zsh-users/zsh-autosuggestions

	# Extra zsh completions
	zsh-users/zsh-completions

	docker
	history
	colored-man-pages
	command-not-found
	ssh-agent
EOBUNDLES

# Load the theme
#antigen theme agnoster
#antigen theme https://github.com/denysdovhan/spaceship-prompt spaceship
antigen theme eendroroy/alien alien
# Tell antigen that you're done
antigen apply
