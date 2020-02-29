setopt promptsubst

autoload colors && colors
	
current_git_branch() {
  git rev-parse --abbrev-ref HEAD 2> /dev/null
}

PROMPT="%1d %{$fg[green]%}\$(current_git_branch) %{$reset_color%}> "

# nvm #
#######
export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh

# Git #
#######

alias gs="git status"
alias gcm="git commit -m"
alias gd="git diff"
alias push="git push origin"
alias fpush="git push -f origin"
alias pull="git pull origin"
alias rebase="git pull --rebase origin"
alias gco="git checkout"
alias copybranch="git rev-parse --abbrev-ref HEAD | pbcopy"

function ga() {
  git add $1
  git status
}

function gbsearch() {
  git branch --list "*$1*"
}

function grsearch() {
  git branch --remote --list "*$1*"
}


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

alias be="bundle exec"
alias spec="bundle exec rspec"
alias t="bundle exec rspec"
alias routes="rails routes --expanded -c"

# End #
#######

eval "$(rbenv init -)"

echo "ZSHRC Reloaded"
