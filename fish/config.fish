function fish_prompt -d "Write out the prompt"
    # This shows up as USER@HOST /home/user/ >, with the directory colored
    # $USER and $hostname are set by fish, so you can just use them
    # instead of using `whoami` and `hostname`
    printf '%s@%s %s%s%s > ' $USER $hostname \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting

end

starship init fish | source
if test -f ~/.cache/ags/user/generated/terminal/sequences.txt
    cat ~/.cache/ags/user/generated/terminal/sequences.txt
end

alias pamcan=pacman
alias k=kubectl
alias tf=terraform
alias compose="docker compose"

function rider
    tmux new-session -d -s rider /home/gabe/rider/rider
    exit
end

function goland
    tmux new-session -d -s goland /home/gabe/goland/src/GoLand-2024.3.2/bin/goland
    exit
end

function datagrip
    tmux new-session -d -s datagrip /home/gabe/Applications/datagrip/src/DataGrip-2024.3.3/bin/datagrip
    exit
end
#
# function fish_prompt
#   set_color cyan; echo (pwd)
#   set_color green; echo '> '
# end

starship init fish | source

zoxide init fish --cmd cd | source

set JAVA_HOME /usr/lib/jvm/default
set PATH $JAVA_HOME/bin $PATH
set ANDROID_HOME /home/gabe/Android/Sdk
set ANDROID_SDK_ROOT /home/gabe/Android/Sdk
set PATH $ANDROID_HOME/cmdline-tools/latest/bin $ANDROID_HOME/platform-tools $ANDROID_HOME/emulator $PATH

set DOTNET_ROOT $HOME/dotnet
set PATH $PATH:$HOME/dotnet

set QT_QPA_PLATFORM xcb
