### Zsh Configuration File ###

### Workflow ###
setopt auto_cd

# Enable Ctrl+s Ctrl+q
setopt noflowcontrol

stty start undef
stty stop undef

### Prompt ###
setopt prompt_subst

RPROMPT=''
PROMPTPWD="%B%(!.%F{magenta}.%F{blue})%31<…<%2~%f %(?.>.%F{red}>%f)%b "
PROMPT=$'${PROMPTPWD}'

### History ###
setopt histignorealldups sharehistory

HISTSIZE=1000
SAVEHIST=1000
HISTFILE="${ZDOTDIR}/.zhistory"

### Completions ###
autoload -Uz compinit
compinit

# zstyle ':completion:*' auto-description 'specify: %d'
# zstyle ':completion:*' completer _expand _complete _correct _approximate
# zstyle ':completion:*' format 'Completing %d'
# zstyle ':completion:*' group-name ''
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*' list-colors ''
# zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
# zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
# zstyle ':completion:*' menu select
# zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
# zstyle ':completion:*' use-compctl false
# zstyle ':completion:*' verbose true

# zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Aliases
[ -r "${ZDOTDIR}/.zalias" ] && {
  source "${ZDOTDIR}/.zalias"
}

# Key bindings
# Use Emacs keys
bindkey -e

### Plugins / Extensions ###
[ -r "${ZDOTDIR}/antigen.zsh" ] && {
  source "${ZDOTDIR}/antigen.zsh"

  antigen bundle "${ZDOTDIR}/antigen/bundles/custom" --no-local-clone
  antigen bundle "veelenga/crystal-zsh"
  antigen bundle "Aloxaf/fzf-tab"
  antigen bundle "zdharma/fast-syntax-highlighting"
  antigen bundle "zsh-users/zsh-autosuggestions"
  ZSH_AUTOSUGGEST_MANUAL_REBIND="true"

  antigen apply
}
