export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"
DEFAULT_USER=$USER

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Only context I want is file-path
prompt_context() {}

# Prompt should start on new line
prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n " %{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  echo -n "\e[m\n➜%{%f%}"
  CURRENT_BG=''
}

# export N_PREFIX=~/.n
source ~/.secretrc
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export EDITOR="nvim"
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/.rgrc"
export PATH="/opt/homebrew/bin:$PATH"
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

alias nv="nvim"
alias mux="tmuxinator"
alias lg="lazygit"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/johnbjornevik/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/johnbjornevik/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/johnbjornevik/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/johnbjornevik/google-cloud-sdk/completion.zsh.inc'; fi

# opam configuration
[[ ! -r /Users/johnbjornevik/.opam/opam-init/init.zsh ]] || source /Users/johnbjornevik/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
