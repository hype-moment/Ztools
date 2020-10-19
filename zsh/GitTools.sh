#/usr/bin/env bash

#=============
# GitHub Tools
#=============

Git-Status(){

GitDir(){
gitdir=$(git rev-parse --is-inside-work-tree 2>/dev/null)

if [[ $gitdir = true ]]; then
  echo -e "━━━%F{#4b45ff}[%f %F{#00ff00} Master%f"
fi
}

Modify(){
sts1=$(git status 2>/dev/null | grep modified | awk '{print $1}')

    if [[ $sts1 = modified: ]]; then
        echo "%F{#ff6262}🆕%f"
    fi
}

Commit(){
    sts2=$(git status 2>/dev/null | grep "changes added" | wc -l)

    if [[ $sts2 = 1 ]]; then
      echo "%F{#f7ff5e}🆙 %K{#121212}%f%F{#73ff5d}add %F{#FFFFFF}and %F{#6978ff}commit%k%f"
    fi
}

Push(){
  sts3=$(git status 2>/dev/null | grep 'use "git push"' | sed -n 1p | wc -l)

  if [[ $sts3 = 1 ]]; then
    echo -e "%F{#00FF00}%F{#FF0000}🔝%f %K{#121212}push%k%f"
  fi
}

  echo -e $(GitDir) $(Modify) $(Commit) $(Push)

}




