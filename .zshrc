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

# Set up Homebrew environment variables
eval "$(/opt/homebrew/bin/brew shellenv)"

export EDITOR=nvim
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# Enable menu selection for completions
zstyle ':completion:*' menu select

# Brew Autocomplete
alias brew='arch -arm64 brew'
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  autoload -Uz compinit
  compinit
fi

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

# Disable Ctrl+D to prevent accidental exit
setopt IGNORE_EOF

alias cl="clear"
alias claer="clear"
alias lear="clear"
alias laer="clear"
alias c="claude --tools Read,Write,Edit,Bash,Grep,Glob,AskUserQuestion,TodoWrite,Task"
alias cluade="claude"
alias cladue="claude"
alias ci="composer install"
alias cb="composer build"
alias cda="composer dump-autoload"
alias ct="composer test"
alias pa="php artisan"
alias doc="docker compose"
alias doe="docker exec"
alias dom="docker model"
alias dddud="doc down && doc up -d"
alias dddbncdud="doc down && doc build --no-cache && doc up -d"
alias ni="npm install"
alias nb="npm run build"
alias nd="npm run dev"
alias ns="npm run serve"
alias nt="npm test"
alias nsb="npm run storybook"
alias t="task"
alias tl="task list"
alias tc="task create"
alias td="task delete"
alias ts="task sync"
alias gaf="git add \$(git diff --name-only | fzf)"
alias guf="git reset \$(git diff --cached --name-only | fzf)"
alias grf="git restore \$(git status --porcelain | cut -c4- | fzf)"

# Use n as a way to launch nvim in the current directory if none is specified
alias n="nvim"
compdef '_files -g "*.*(-.)"' n

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
