#!/usr/bin/env bash

# Pacman functions
#=================
# The functions of this block are for the 
# exclusive use of arch linux and its derivatives
#=================================================

# used to check for updates, displays on the screen and update the system
function updates(){
clear
while :; do
    for i in C c C c C c C c C c C c C c C c C c C c C c C c C c C c C c C c C c C; do
        echo -ne "\033[1;3;41m\b $i\033[m"; sleep 0.1
done
clear
     sleep 0.1
        space="                   " 
        sep="━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        ups=$(checkupdates 2> /dev/null | sed 's/ /  | /;s/ -> /| /' | column -t -s "|")
        layout="Package    |Version  |New Version"
        total=$(checkupdates 2> /dev/null | wc -l)

                if [[ $ups > 0 ]]; then
                        echo "$sep"
                        echo -e "New updates$space\033[1;42mTotal $total\033[m"
                        echo "$sep"
                        echo -e "$layout" | column -t -s "|"
                        echo "$sep"
                        echo "\033[1;31m$ups\033[m"
                        echo "$sep"
                        echo -e "Would you like to update the packages? \033[1;32my\033[m|\033[1;31mn\033[m?"
                        
                          read opc
                            case $opc in
                              Y|y ) sudo pacman -Syu >> /dev/null
                                ;;
                              N|n ) echo -e "\nOK! ;)"
                            esac
                else
                        echo "No pending updates"
                fi
break
done
}

# use to install packages
# the packages will be displayed on the screen
# showing the package information focused on the right side
# will also be displayed if the package is installed
# you can use the keyboard to navigate through the options and also search for a specific package

function install(){
  pacman -Sl | awk '{print $2" "$4}' \
  | column -t | fzf --reverse --preview 'pacman -Si {1}' \
  | xargs -ro sudo pacman -S 
}

# this function installs packages from the AUR repository in the same way as the previous function

function yinstall(){
  yay -Sl | awk '{print $2" "$4}' \
  | column -t | fzf --reverse --preview 'yay -Si {1}' \
  | xargs -ro yay -S 
}

# use to delete packages,
# Attention! the packages will be removed
# along with your dependencies
# and configuration files.

function delete(){
  pacman -Sl | awk '{print $2" "$4}' \
  | column -t | grep instalado | fzf --reverse --preview 'pacman -Si {1}' \
  | awk '{print $1}' | xargs -ro sudo pacman -Rscn
 
}