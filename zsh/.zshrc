# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="agnoster"

# https://github.com/romkatv/powerlevel10k
ZSH_THEME="powerlevel10k/powerlevel10k"
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
export FLUTTER_SDK="$HOME/flutter/bin"
export PATH="$PATH:$FLUTTER_SDK"
ANDROID_PLATFORM_TOOLS="$HOME/Library/Android/sdk/platform-tools"
ANDROID_TOOLS="$HOME/Library/Android/sdk/tools"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_PLATFORM_TOOLS:$ANDROID_TOOLS"

alias nv="nvim"
alias nnv="NVIM_APPNAME=neoneovim nv" # new wip neovim config
alias mux="tmuxinator"
alias lg="lazygit"
alias ll="lsd -l -a"
alias fman="compgen -c | fzf | xargs man"
alias cps="gh copilot suggest"
alias cpe="gh copilot explain"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/johnbjornevik/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/johnbjornevik/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/johnbjornevik/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/johnbjornevik/google-cloud-sdk/completion.zsh.inc'; fi

# opam configuration
[[ ! -r /Users/johnbjornevik/.opam/opam-init/init.zsh ]] || source /Users/johnbjornevik/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
