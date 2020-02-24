setopt promptsubst

autoload colors && colors
	
current_git_branch() {
  git rev-parse --abbrev-ref HEAD 2> /dev/null
}

PROMPT="%1d %{$fg[green]%}(\$(current_git_branch)) %{$reset_color%}> "

# nvm #
#######
export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh

# Git #
#######

alias gs="git status"

function ga() {
  git add $1
  git status
}

function gcm() {
  git commit -m $1
}

function gd() {
  git diff $1
}

function push() {
  git push origin $1
}

function fpush() {
  git push -f origin $1
}

function pull() {
  git pull origin $1
}

function rebase() {
  git pull --rebase origin $1
}

function gco() {
  git checkout $1
}

function gbsearch() {
  git branch --list "*$1*"
}

function grsearch() {
  git branch --remote --list "*$1*"
}

alias copybranch="git rev-parse --abbrev-ref HEAD | pbcopy"

# Elixir #
##########

function e() {
  elixir $1
}

alias extest="iex -S mix test"

# General #
###########

alias editzsh="vim ~/.zshrc"

alias loadzsh="source ~/.zshrc"
alias l="loadzsh"

function new() {
  touch $1
  code $1
}

function exreset() {
  mix ecto.drop
  mix ecto.create
  mix ecto.migrate
  mix run priv/repo/seeds.exs
}

function h() {
  cd ~/$1
}

# Rails #
#########

routes() {
  rails routes --expanded -c $1
}

be () {
  bundle exec $1
}

# End #
#######

eval "$(rbenv init -)"

echo "ZSHRC Reloaded"
