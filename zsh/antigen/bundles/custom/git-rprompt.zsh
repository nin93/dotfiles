BASE_RPROMPT=$RPROMPT
ASYNC_PROC=0

GIT_AHEAD=0
GIT_BEHIND=0
GIT_STAGED=0
GIT_CONFLICTS=0
GIT_CHANGED=0
GIT_UNTRACKED=0

# GIT_CHAR_SEPARATOR="|"
GIT_CHAR_SEPARATOR=""
GIT_CHAR_STATUS="●"

GIT_CHAR_STAGED="${GIT_CHAR_STAGED:-#}"
GIT_CHAR_CLEAN="${GIT_CHAR_CLEAN:-✓}"
GIT_CHAR_CONFLICT="${GIT_CHAR_CONFLICT:-✗}"
GIT_CHAR_DELETED="${GIT_CHAR_DELETED:--}"
GIT_CHAR_CHANGED="${GIT_CHAR_CHANGED:-~}"
GIT_CHAR_ADDED="${GIT_CHAR_ADDED:-+}"
GIT_CHAR_BRANCH="${GIT_CHAR_BRANCH:- @}"
GIT_CHAR_AHEAD="${GIT_CHAR_AHEAD:-▴}"
GIT_CHAR_BEHIND="${GIT_CHAR_BEHIND:-▾}"

function precmd() {
  RPROMPT=$BASE_RPROMPT

  # Kill child if necessary
  if [[ "${ASYNC_PROC}" != 0 ]]; then
    kill -s HUP $ASYNC_PROC >/dev/null 2>&1 || :
  fi

  # Start background computation
  _build_prompt &!
  ASYNC_PROC=$!
}

function TRAPUSR1() {
  RPROMPT="$(cat /tmp/zsh_git_prompt_$$ 2> /dev/null)"
  ASYNC_PROC=0

  zle && zle reset-prompt
}

function _build_prompt() {
  if git rev-parse --is-inside-work-tree &> /dev/null
  then
    GIT_DIR="$(git --no-optional-locks rev-parse --absolute-git-dir 2>/dev/null)"
    GIT_POSITION="$(git --no-optional-locks symbolic-ref --short HEAD 2>/dev/null)"
    GIT_REPO="$(basename $(git rev-parse --show-toplevel))"
    GIT_CHANGED="$(git diff --diff-filter=M --name-only | wc -l)"
    GIT_ADDED="$(git ls-files --others --exclude-standard | wc -l)"
    GIT_DELETED="$(git diff --diff-filter=D --name-only | wc -l)"
    GIT_STAGED="$(git diff --name-only --cached | wc -l)"

    GIT_BEHIND=0
    GIT_AHEAD=0

    if [ -n "$(git remote -v)" ]; then
      git rev-list --left-right --count origin/master...${GIT_POSITION} | read GIT_BEHIND GIT_AHEAD
    fi

    # Erase
    GIT_ACTION=""
    GIT_STATUS=""
    GIT_DIFF_STATUS=""
    GIT_COMM_STATUS=""

    if test -f "$GIT_DIR/MERGE_HEAD"; then
      GIT_ACTION="merge"
    elif test -d "$GIT_DIR/rebase-merge"; then
      GIT_ACTION="rebase"
    elif test -d "$GIT_DIR/rebase-apply"; then
      GIT_ACTION="rebase"
    fi

    if [[ "${GIT_STAGED}" == 0 ]]; then
      GIT_STAGED=""
    else
      GIT_STAGED="%B%F{blue}${GIT_STAGED}${GIT_CHAR_STAGED}%f%b"
    fi
    if [[ "${GIT_ADDED}" == 0 ]]; then
      GIT_ADDED=""
    else
      GIT_ADDED="%B%F{green}${GIT_ADDED}${GIT_CHAR_ADDED}%f%b"
    fi
    if [[ "${GIT_CHANGED}" == 0 ]]; then
      GIT_CHANGED=""
    else
      GIT_CHANGED="%B%F{yellow}${GIT_CHANGED}${GIT_CHAR_CHANGED}%f%b"
    fi 
    if [[ "${GIT_DELETED}" == 0 ]]; then
      GIT_DELETED=""
    else
      GIT_DELETED="%B%F{red}${GIT_DELETED}${GIT_CHAR_DELETED}%f%b"
    fi

    if [[ "${GIT_BEHIND}" == 0 ]]; then
      GIT_BEHIND=""
    else
      GIT_BEHIND="%B%F{red}${GIT_CHAR_BEHIND}${GIT_BEHIND}%f%b"
    fi 
    if [[ "${GIT_AHEAD}" == 0 ]]; then
      GIT_AHEAD=""
    else
      GIT_AHEAD="%B%F{green}${GIT_AHEAD}${GIT_CHAR_AHEAD}%f%b"
    fi

    GIT_DIFF_ARRAY=($GIT_STAGED $GIT_ADDED $GIT_CHANGED $GIT_DELETED)
    GIT_DIFF_STATUS="${(@j.$GIT_CHAR_SEPARATOR.)GIT_DIFF_ARRAY:#}"

    GIT_COMM_ARRAY=($GIT_BEHIND $GIT_AHEAD)
    GIT_COMM_STATUS="${(@j.$GIT_CHAR_SEPARATOR.)GIT_COMM_ARRAY:#}"

    if [ -n "${GIT_COMM_STATUS}" ]; then
      GIT_STATUS="${GIT_STATUS}%F{magenta}(%f${GIT_COMM_STATUS}%F{magenta})%f"
    fi
    if [ -n "${GIT_DIFF_STATUS}" ]; then
      GIT_STATUS="${GIT_STATUS}%F{magenta}(%f${GIT_DIFF_STATUS}%F{magenta})%f"
    fi

    # Tree is clean
    if [ -z "${GIT_STATUS}" ]; then
      GIT_STATUS="%F{magenta}(%f%B%F{green}${GIT_CHAR_CLEAN}%f%b%F{magenta})%f"
    fi

    GIT_REPO="%B%F{cyan}${GIT_REPO}%f%b"
    GIT_POSITION="%B%F{cyan}${GIT_CHAR_BRANCH}${GIT_POSITION}%f%b"
    print "${GIT_REPO}${GIT_POSITION}${GIT_STATUS}" > /tmp/zsh_git_prompt_$$

    # Signal parent
    kill -s USR1 $$
  fi
}
