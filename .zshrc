# ==============================================
# 1. PATH & ENVIRONMENT (The "Arch Way")
# ==============================================
# Force Zsh to remove duplicates automatically
typeset -U PATH

# Add custom p# Add Composer Global Bin to PATH
export PATH="$HOME/.local/bin:$HOME/apps:$PATH"
# # Add Composer Global Bin to PATH
# export PATH="$PATH:$HOME/.config/composer/vendor/bin"

export TERM=xterm-256color
export EDITOR="nvim"

# ==============================================
# 2. OH-MY-ZSH CONFIG
# ==============================================
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# ==============================================
# 3. MANUAL PLUGINS (Source Only Once)
# ==============================================
# Autosuggestions & Syntax Highlighting
if [ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#999999"
fi

if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# ===========================================================================================
# 4.HISTORY & BEHAVIOR (Essential for Tmux), FORCE HISTORY SHARING (Place at bottom of .zshrc)
# ============================================================================================
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt AUTO_CD             # Type directory name to cd into it
setopt APPEND_HISTORY      # Append history instead of rewriting

# SCENARIO: You type mkdir test in Pane A.
# PROBLEM: You switch to Pane B, but the prompt is already sitting there idle.
# If you press "Up Arrow", nothing happens.
# THE FIX: You must press ENTER on an empty line in Pane B first. 
# This forces Zsh to re-draw the prompt and re-read the history file.
# Then the Up Arrow will work.

# 1. Append immediately (don't wait for exit)
setopt INC_APPEND_HISTORY  # Save commands immediately, not at exit

# 2. Share immediately (read new commands from other panes)
setopt SHARE_HISTORY       # Share history between tmux panes instantly

# 3. Clean up the file
setopt EXTENDED_HISTORY       # Record timestamps (helps syncing)
setopt HIST_EXPIRE_DUPS_FIRST # Delete duplicates first when history is full
setopt HIST_IGNORE_DUPS       # Ignore duplicate commands
setopt HIST_IGNORE_ALL_DUPS   # Delete old duplicates
setopt HIST_FIND_NO_DUPS      # Do not display duplicates during search

# ==============================================
# 5. ALIASES & FUNCTIONS
# ==============================================
# -- Navigation --
# alias ..="cd .."
# alias ...="cd ../.."
# alias l="ls -lh"
# alias la="ls -la"
alias l="eza -lh --icons"
alias la="eza -lha --icons --group-directories-first"

# -- Tools --
alias n="nvim"
# alias v="vim"
# ddev artison/composer
alias dr="ddev artisan"
alias dc="ddev composer"
# php artison/composer
alias pr="php artisan"
alias pc="php composer"
alias :q="exit"  # Muscle memory save
# alias c="clear"
# alias g="git"

# -- Clipboard --
alias getpath="fd --type d | fzf -e | tr -d '\n' | xclip -selection c"
alias cout="xclip -o -selection c"

# -- History search with fzf and xclip --
alias hf="fc -ln 1 | fzf -e | tee /dev/tty | xclip -selection clipboard"

# -- Functions --
fcd() {
    local dir
    dir=$(fd --type d --max-depth 3 | fzf) && cd "$dir"
}

# ==============================================
# 6. KEYBINDINGS
# ==============================================
bindkey -v              # Enable Vi mode

# TMUX Sessionizer
bindkey -s '\ef' "tmux-sessionizer\n"

# ==============================================
# 7. UI FIXES
# ==============================================
# Force blinking block cursor (Fix for Tmux/Neovim cursor shapes)
echo -ne '\e[1 q'

# ==============================================
# 8. other configs
# ==============================================
# Add global Composer tools to system PATH
# Composer Tools
export PATH="$HOME/.config/composer/vendor/bin:$HOME/.composer/vendor/bin:$PATH"
# export PATH="$HOME/.config/composer/vendor/bin:$PATH"
