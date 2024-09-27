# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PNPM_HOME="/Users/brian/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-22.jdk/Contents/Home"
PATH="${JAVA_HOME}/bin:${PATH}"
export PATH
export M2_HOME="/etc/maven/apache-maven-3.9.6"
PATH="${M2_HOME}/bin:${PATH}"
export PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  macos
  zsh-autosuggestions
  zsh-nvm
  zsh-syntax-highlighting
  z
)

source $ZSH/oh-my-zsh.sh

####
# Aliases
####

alias ta='tmux a'
alias brew='arch -arm64 brew'

# Brew Autocomplete
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  autoload -Uz compinit
  compinit
fi

# use code and z commands to open a vs code project by fuzzy dir name match
vs () {
  code `z -e ${1}`
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

