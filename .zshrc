# Auto-attach to tmux on SSH login (must be above p10k instant prompt)
if [[ -n "$SSH_CONNECTION" && -z "$TMUX" && -t 0 ]]; then
  if tmux list-sessions &>/dev/null; then
    exec tmux attach
  else
    exec tmux new-session
  fi
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export EDITOR=nvim
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[[ ! -f ~/.zshrc.local ]] || source ~/.zshrc.local
[[ ! -f ~/.local/bin/env ]] || source ~/.local/bin/env
[[ ! -f ~/.config/tabtab/__tabtab.zsh ]] || source ~/.config/tabtab/__tabtab.zsh

plugins=(
  git
  macos
  zsh-autosuggestions
  zsh-nvm
  zsh-syntax-highlighting
  z
)

source $ZSH/oh-my-zsh.sh

alias c="claude"
alias cl="clear"
alias lear="clear"
alias nd="npm run dev"
alias nb="npm run build"
alias nt="npm run test"
alias ni="npm install"
alias t="task"
alias tl="task list"
alias brew='arch -arm64 brew'

# Brew Autocomplete
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  autoload -Uz compinit
  compinit
fi

# use n as a way to launch nvim in the current directory if none is specified
n () {
  nvim "${1:-.}"
}

# use code and z commands to open a vs code project by fuzzy dir name match
vs () {
  code `z -e ${1}`
}

# export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
# export PNPM_HOME="/Users/brian/Library/pnpm"
# export PATH="$PNPM_HOME:$PATH"
# JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-22.jdk/Contents/Home"
# export PATH="${JAVA_HOME}/bin:${PATH}"
# export M2_HOME="/etc/maven/apache-maven-3.9.6"
# export PATH="${M2_HOME}/bin:${PATH}"
