#!/usr/bin/env bash

#=============
# System Tools
#=============

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

#=============
# GitHub Tools
#=============

function Gits(){
    G=$(file .git | sed 's/ //g')

    if [[ $G == .git:directory ]]; then
      echo -e "%K{#ff5977}  Master %k"
    else 
    fi
}

function GitStatus(){
  sts1=$(git status | grep modified | awk '{print $1}' 2> /dev/null)

  if [[ $sts1 = modified: ]]; then
    echo -e "%F{#ffaa00} %f  Master %F{#FF0000}%f "
  else
    echo "%F{#ffaa00} %f  Master %F{#00FF00} %f "
  fi
}

function Git_Status(){
  G=$(file .git | sed 's/ //g')

  if [[ $G == .git:directory ]]; then
     echo -e "$(GitStatus)"
  fi
}

function SimpleGitStatus(){
  sts1=$(git status | grep modified | awk '{print $1}' 2> /dev/null)
  
  if [[ $sts1 = modified: ]]; then
    echo -e " %F{#FF0000}─━╾╸(%F{#45ff30}%f  Master %F{#FF0000}🆕%f%F{#FF0000}) "
  else
  	echo " %F{#FF0000}─━╾╸(%F{#45ff30}%f  Master %F{#00FF00}🆗 %f%F{#FF0000})"
  
  fi
  
}

function SimpleGit_Status(){
  G=$(file .git | sed 's/ //g')

  if [[ $G == .git:directory ]]; then
     echo -e "$(SimpleGitStatus)"
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
	PS1=' $User2) %m'
}