#  ---  zshrc  ---
#
# author: schmaeke
# edited: 16.02.2025
#

# cursor mode
echo -ne '\e[3 q'

# autoconplete
if [[ -f ~/Projects/Tools/zsh-autocomplete/zsh-autocomplete.plugin.zsh ]]; then
	source ~/Projects/Tools/zsh-autocomplete/zsh-autocomplete.plugin.zsh
fi

# alias
alias ls="ls --colo=auto"
alias grep="grep --color=auto"
alias gu="gitui"
alias vi="hx"
alias vim="hx"
alias nvim="hx"
alias edit="hx"

# enviroment variables
export EDITOR="hx"
export PYGMENTIZE_STYLE="native"
export CLUCOLOR=1

# load verson control system
autoload -Uz vcs_info
precmd() { vcs_info }

# setup git branch details in prompt
zstyle ':vcs_info:git:*' formats ' %F{7}on%f %F{9} %b%f'
zstyle ':vcs_info:*' enable git

# setup prompt
setopt PROMPT_SUBST

NEWLINE=$'\n'
PROMPT='${NEWLINE}%F{11}%n%f %F{7}on%f %F{15}%m%f %F{7}in%f %F{12}%~%f${vcs_info_msg_0_}${NEWLINE}%F{15}󰘳%f '

# syntax highlighting
if [[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
	source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
