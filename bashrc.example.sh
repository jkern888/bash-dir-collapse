UL='\e[4;33m'
NO_UL='\e[0;33m'

function compress_pwd {
 
  if [ ${#PWD} -le 50 ]
  then
    echo -n ${PWD/$HOME/\~}
  else
    HOLD_IFS=$IFS
    IFS="/"
    PATH_A=( ${PWD/$HOME/\/\~} )
    IFS=$HOLD_IFS

    if [ ${#PATH_A[@]} -le 2 ]
    then
      echo -n ${PWD/$HOME/\~}
    else
      RANGE=$(( ${#PATH_A[@]} - 2 ))
      OUT=""
      for i in $(seq 1 $RANGE)
      do
        OUT="$OUT/${PATH_A[$i]:0:1}"
        if [ ${#PATH_A[$i]} -ge 2 ]
        then
          OUT="$OUT\[${UL}\]${PATH_A[$i]:1:1}\[${NO_UL}\]"
        fi
      done
      END=$(( ${#PATH_A[@]} - 1 ))
      OUT=$OUT/${PATH_A[$END]}
      echo -ne "${OUT/\/\~/~}"
    fi
  fi
}

function make_prompt {
  C_PATH="$(compress_pwd)"
  export PS1="[\[\e[0;36m\]\u\[\e[0m\]@\[\e[0;36m\]\h\[\e[0m\]](\[\e[0;33m\]$C_PATH\[\e[0m\])$ "
}

export PROMPT_COMMAND='make_prompt'
