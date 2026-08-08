# --- HISTORIAL ---
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

# --- OPCIONES DEL SHELL ---
setopt autocd
setopt interactivecomments

# --- BÚSQUEDA EN HISTORIAL POR CONTEXTO ---
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Flecha Arriba / Abajo (Filtra por lo que hayas escrito)
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

# --- MAPEO DE TECLAS (BINDINGS) ---
# Navegación por palabras
bindkey '^[[1;5D' backward-word                      # Ctrl + Flecha Izquierda
bindkey '^[[1;5C' forward-word                       # Ctrl + Flecha Derecha

# Borrado por caracteres
bindkey '^?' backward-delete-char                    # Backspace normal (1 carácter a la izquierda)
bindkey '^H' backward-delete-char                    # Backspace alternativo
bindkey '^[[3~' delete-char                          # Suprimir normal (1 carácter a la derecha)

# Borrado por palabras completas
bindkey '^W' backward-kill-word                      # Ctrl + Backspace
bindkey '^[[3;5~' kill-word                          # Ctrl + Suprimir (palabra a la derecha)
bindkey '^[[1;3~' kill-word                          # Alt + Suprimir

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# --- AUTOCOMPLETADO AUTOMÁTICO ---
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

# --- INYECCIÓN DE PLUGINS NATIVOS DE ARCH LINUX ---
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# Nota: Sintax Highlighting SIEMPRE debe ser la última fuente cargada
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# --- INICIALIZACIÓN DEL PROMPT (STARSHIP) ---
eval "$(starship init zsh)"

# --- EXECUCIÓN AL ABRIR TERMINAL ---
fastfetch
