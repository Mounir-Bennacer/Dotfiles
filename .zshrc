# ===================================================================#
#                         ZSH CONFIG SETUP                           #
#                                                                    #
#  AUTHOR: MOUNIR BENNACER                                           #
#  VERSION: 1.3.7                                                    #
#                                                                    #
# ===================================================================#
export LC_ALL=en_US.UTF-8

# Created by manan for 4.4.2
export TERM="xterm-256color"

HOMEBREW_FOLDER="/usr/local/share"
source "$HOMEBREW_FOLDER/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$HOMEBREW_FOLDER/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOMEBREW_FOLDER/zsh-history-substring-search/zsh-history-substring-search.zsh"

autoload -Uz compinit;
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi

zmodload -i zsh/complist

#History setup
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZ

setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances of the shell
setopt auto_cd # cd by typing directory name if it's not a command
setopt correct_all # autocorrect commands
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match

zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate #enable approximate matches for completion

#Plugins setup
source <(antibody init)
antibody bundle zdharma/fast-syntax-highlighting > ~/.zshrc.log
antibody bundle zsh-users/zsh-autosuggestions > ~/.zshrc.log
antibody bundle zsh-users/zsh-history-substring-search > ~/.zshrc.log
antibody bundle zsh-users/zsh-completions > ~/.zshrc.log
# antibody bundle $HOME/Editor-Settings/ZSH-Plugins/oh-my-zsh-master/plugins/osx > ~/.zshrc.log
# antibody bundle robbyrussell/oh-my-zsh path:plugins/heroku > ~/.zshrc.log
# antibody bundle robbyrussell/oh-my-zsh path:plugins/node > ~/.zshrc.log
# antibody bundle robbyrussell/oh-my-zsh path:plugins/web-search > ~/.zshrc.log
# antibody bundle robbyrussell/oh-my-zsh path:plugins/sudo > ~/.zshrc.log
# antibody bundle robbyrussell/oh-my-zsh path:plugins/react-native > ~/.zshrc.log
# antibody bundle robbyrussell/oh-my-zsh path:plugins/kubectl > ~/.zshrc.log
# antibody bundle robbyrussell/oh-my-zsh path:plugins/npm > ~/.zshrc.log
# antibody bundle JamesKovacs/zsh_completions_mongodb > ~/.zshrc.log

autoload -Uz compinit;compinit -i

# Aliases

# alias grep=ack
alias digitalocean="ssh digitalocean"
alias msfc="/opt/metasploit-framework/bin/msfconsole"
alias config="nvim $HOME/.zshrc"
alias code="cd $HOME/Code/"
alias reload="source $HOME/.zshrc"

# Git aliases
alias gi="git init"
alias gs="git status -sbu"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gp="git push"
alias gm="git merge"
alias ga="git add ."
alias gcm="git commit -m"
alias gpl="git pull"
alias gst="git stash"
alias gstl="git stash list"
alias glg='git log --graph --oneline --decorate --all'

# alias ls='colorls'
alias ls="lsd"
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

# CONFIG OF NEOVIM INIT FILE
alias nviminit='nvim ~/.config/nvim/init.vim'
alias neovim='cd ~/.config/nvim/'
alias nvimplug='nvim ~/.config/nvim/plugins.vim'

# tmux aliases
alias t="tmux"
alias ta="t a -t"
alias tls="t ls"
alias tn="t new -t"

# ====================================================================
# ===                       EXPORT PATHS                           ===
# ====================================================================

export PATH="/usr/local/opt/libpcap/bin:$PATH"
fpath=(/usr/local/share/zsh-completions $fpath)
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PYTHON3PATH=/Library/Frameworks/Python.framework/Versions/3.7
export PATH=$PYTHON3PATH/bin:$PATH
export PATH="$PATH:`pwd`/flutter/bin"
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="/usr/local/anaconda3/bin:$PATH"
# source /usr/local/aws/bin/aws_zsh_completer.sh
# Go development
export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
test -d "${GOPATH}" || mkdir "${GOPATH}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"

# added by travis gem
[ -f /Users/manan/.travis/travis.sh ] && source /Users/manan/.travis/travis.sh

# Misc
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Tab title
precmd() {
  # sets the tab title to current dir
  echo -ne "\e]1;${PWD##*/}\a"
}

# Create a new react app

react-app() {
  npx create-react-app $1
  cd $1
  npm i -D eslint
  npm i -D eslint-config-prettier eslint-plugin-prettier
  npm i -D eslint-config-airbnb eslint-plugin-import eslint-plugin-jsx-a11y eslint-plugin-react eslint-plugin-react-hooks
  cp "${HOME}/.eslintrc.json" .
  cp "${HOME}/.prettierrc" .
  echo $1 > README.md
  rm -rf yarn.lock
  cd src
  rm -f App.css App.test.js index.css logo.svg serviceWorker.js
  mkdir components views
  git add -A
  git commit -m "Initial commit."
  cd ..
  clear
  code .
}
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshr

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
autoload -U compinit && compinit
plugins=(… zsh-completions)
prompt spaceship
alias cfg='/usr/bin/git --git-dir=/Users/Phaoris/.cfg/ --work-tree=/Users/Phaoris'

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
