###############
# zsh aliases #
###############

# color
alias grep='grep --color=auto'
alias tree='tree -C'
alias pacman='pacman --color=auto'
alias yay='yay --color=auto'
alias valgrindc='colour-valgrind'

# common commands
alias less='less -N'   # enable line number
alias v='vim'
# alias vim='nvim'
# alias mkdir='mkdir -p'
alias gdb='gdb -q'     # disable long intro message
alias sudo='sudo '     # enable color (the search for aliases continues)
alias doas='doas '     # same for doas
alias info='info --vi-keys'

# ls
alias ls='ls --color=auto -F'
alias ll="ls -lh"
alias la="ls -a"
alias lla="ls -alh"
alias lss="ls -Ssh"

# tree
alias tree='tree -FCA'
alias t='tree'
alias ta='tree -a'
alias t1='tree -L 1'
alias t2='tree -L 2'
alias t3='tree -L 3'
alias ti="tree --matchdirs -I __pycache__ -I node_modules -I '*.o'"

# man
alias ma="man"
alias ma1="man 1"
alias ma2="man 2"
alias ma3="man 3"

# make
alias m='make'
alias mre='make re'
alias mclean='make clean'

# git
alias ga='git add'
alias gaa='git add --all'
alias gau='git add --update'
alias gc='git commit'
alias gc!='git commit --amend'
alias gcmsg='git commit --message'
alias gd='git diff'
alias gds='git diff --staged'
alias gdt='git diff --stat'
alias gl='git pull'
alias glg='git log --abbrev-commit --stat'
alias glgg='git log --abbrev-commit --graph'
alias glgo='git log --oneline --no-decorate'
alias gp='git push'
alias gcl='git clone --recurse-submodules'
alias gst='git status'
alias gs='git status'
alias gss='git status --short'
alias gco='git checkout'
alias gsta='git stash push'
alias gstp='git stash pop'
alias grv="git remote -v"
alias gra="git remote add"
gpa() {
    branch="$1"
    [ -z "$branch" ] && branch=$(git branch | grep '^\* .*$' | cut -d ' ' -f 2)
    git remote | xargs -I{} git push {} "$branch"
}
gpaf() {
    branch="$1"
    [ -z "$1" ] && branch=master
    git remote | xargs -I{} git push -f {} "$branch"
}

# lpass (lastpass-cli)
alias lpassp='lpass show --password --clip'  # put password in clipboard

# helper to switch between dual and single monitor setup
alias dual='xrandr --output LVDS1 --primary --left-of VGA1 --output VGA1 --mode 1280x1024'
alias single='xrandr --output VGA1 --off'


# edit config files
alias zshrc="vim $DOTDIR/.zshrc && source $DOTDIR/.zshrc"
alias zshaliasrc="vim $DOTDIR/.zsh_aliases && source $DOTDIR/.zshrc"
alias vimrc="vim $DOTDIR/.vimrc"
alias vimplugrc="vim $DOTDIR/.pluggins.vim"
alias xmonadrc="vim $DOTDIR/xmonad.hs"
alias muttrc="vim $DOTDIR/.muttrc"

# other
#alias date="date -R"

# parent directory jump
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias norminette='ruby ~/git/norminette/norminette.rb'
alias norm='norminette'

getrfc() {
    curl "https://ietf.org/rfc/rfc$1.txt" > "$HOME/rfc/rfc$1.txt"
}

# bluetooth
alias bt='bluetoothctl'
alias bton='echo power on | bluetoothctl'
alias btoff='echo power off | bluetoothctl'

# pdf selector
# alias pdf-open="zathura \$(echo $HOME/Documents/*.pdf | tr ' ' '\\n' | dmenu)"

alias cagob='RUSTFLAGS="$RUSTFLAGS -A dead_code" cargo build'
alias cagor='RUSTFLAGS="$RUSTFLAGS -A dead_code" cargo run'

# wifi
wificonnect() {
    nmcli device wifi connect $1 password $2
}

# alias mutt='neomutt'

alias ytdl='youtube-dl --output "%(title)s.%(ext)s"'
alias ytdlp='youtube-dl --audio-format mp3 -i --output "%(playlist_index)s-%(title)s.%(ext)s"'
alias ytdla='youtube-dl --audio-format mp3 -i -x -f bestaudio/best --output "%(playlist_index)s-%(title)s.%(ext)s"'

alias qmvdest='qmv --format=do'

alias xclip='xclip -selection clipboard'

pacman-url() {
    pacman -Si "$1" | grep URL | tr -s ' ' | cut -d ' ' -f 3
}

grep-kill() {
    ps aux | grep "$1" | tr -s ' ' | cut -d ' ' -f 2 | xargs kill
}

alias filter-valgrind="sed -e 's/==[0-9]*==/==/' -e 's/0x[0-9A-F]*//'"