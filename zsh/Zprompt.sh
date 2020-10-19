#!/usr/bin/env bash

#=============
# System Tools
#=============
source ~/zsh/GitTools.sh

#======
# Vars
#======

User=" %n"
User1=" %n"
User2=" %n"
User3=" %n"
User4=" %n"

Distro_Wm(){

wmname=$(wmctrl -m | grep Name | sed 's/.*: //g')
distroname=$(uname -n | sed 's/linux//g;s/[-"_]//g')

if [[ $distroname = arch ]]; then
  echo -e "%F{#0c81ff} %f $distroname %F{#d12345}$wmname%f "
elif [[ $distroname = debian ]]; then
  echo -e "%F{#ff2f5c} %f $distroname %F{#d12345}$wmname%f "
elif [[ $distroname = ubuntu ]]; then
  echo -e "%F{#ff5d0c} %f $distroname %F{#d12345}$wmname%f "
elif [[ $distroname = fedora ]]; then
  echo -e "%F{#3a65ff} %f $distroname %F{#d12345}$wmname%f "
elif [[ $distroname = slackware ]]; then
  echo -e "%F{#3a65ff}  %f $distroname %F{#d12345}$wmname%f "
elif [[ $distroname = opensuse ]]; then
  echo -e "%F{#55ff7f}  %f $distroname %F{#d12345}$wmname%f "
elif [[ $distroname = manjaro ]]; then
  echo -e "%F{#008820}  %f $distroname %F{#d12345}$wmname%f "
elif [[ $distroname = gentoo ]]; then
  echo -e "%F{#9c9c9c}  %f $distroname %F{#d12345}$wmname%f "
fi
}

GetHome(){
  get_=$(pwd | sed 's/\///g;s/e.*//g')

  if [[ $get_ = hom ]]; then
    echo " Home %K{#121212}"
  else
    echo " Root %K{#121212}"
  fi
}



ERROR(){
  if [ "$?" -eq 0 ]
    then
    echo "%F{#00ff00}%f"
  else 
    echo "%F{#F00000}%f"
fi
}

#========
# Prompts
#========

function PPL1(){
  PS1='%K{#123456}%n%k%F{#123456}%f%F{#FF3F21}%T%f%F{#345678}%f%K{#345678}$(Distro_Wm)%k%F{#345678}%f$(GetHome)%k%F{#567890}%f%K{#567890} %~ %k%F{#567890}%f$(Git_Status)
%F{#ff5566} %(!.#.$)%f ' 
}

function PPL2(){
	PS1='%K{#0000ff} $User %k%F{#0000ff}%K{#3a54ff} %K{#3a54ff}%f $(GetHome)%F{#3a54ff}%K{#6b7fff} %k%k%f%F{#232323}%K{#6b7fff} %~ %k%f%F{#6b7fff} %f '
}

function PPL3(){
	PS1='%F{#F00000}┌%f%F{#b5ff95}$User4%f$(SimpleGit_Status)
%F{#F00000}└(%f%~%F{#F00000})%f %(!.$.#) '
}

function PPL4(){
	PS1='%K{#FFFFFF}%F{#232323}$User2%F{#F12345}@%F{#AE23FF}%m%f %k%F{#FFFFFF}%K{#121212} %f%~%k%F{#121212}%K{#121212}%f%F{#FFFFFF} %k%f '  
}

function PPL5(){
  PS1='%F{#5555ff}╭%f%F{#5555ff}[%f%~%F{#5555ff}]%f$(Git-Status)
%F{#5500ff}╰╴$(ERROR) %f%F{#5500ff}[%f$User4%F{#5500ff}]%f '
}