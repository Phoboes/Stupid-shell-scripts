## Generic aliases:

#### Nomination aliases for programs:
alias subl='open -a "Sublime Text"'
# Open sublime or open a file with sublime text (substitute to whatever).
# Useage:

`subl` # -- Opens sublime text

`subl ./yourFilePath` # -- open anything from that given directory in sublime

#### Opening specific files with an alias 
# This one targets the bash_profile with atom:
alias bp="atom ~/.bash_profile"

#### Alias navigation utilities
alias dt='cd ~/Desktop'
alias hw="cd ~/Desktop/Teaching/Homework\ folders/WDi23-Homework/" # <- Change this directory to match your local machine.

#### Alias multiple commands with `&&`
# This one is handy for establishing new rails projects:
alias rare="bundle && rake db:create && rake db:migrate && rake db:seed && subl . && rails s" # replace 'subl' with 'atom', or your preferred editor

## Scripts: 

#### Simpler SimpleHTTPServer:
# Echos the actual command (I always forget the casing) and listens for a port. If no port is nominated, it goes to default
pServe (){
  echo "-------------------------------------"
  echo "python -m SimpleHTTPServer"
  echo "-------------------------------------"

  if [[ "$1" ]]
    then
      python -m SimpleHTTPServer $1
  else
      python -m SimpleHTTPServer
  fi
}

# Useage:

# `pServe` #-- default Python server

# `pServer 3000` #-- A python server on localhost:3000

#### Say command mischief (for Katie)
# Repeat a given string N number of times, spaced N seconds apart.
say_repeat () {
  for ((i=1; i<=$1; i++))
  do
    say $3
    sleep $((i * $2))
  done
}

# Useage: 

# `say_repeat 10 1 'I'm repeating!'` -- Repeat "I'm repeating!" 10 times, spaced 1 second apart

#### Run scripts  on an empty command entry

# If the enter key is struck and the command line is blank, do x
HISTCONTROL=
detect_blank () {
  HISTCMD_previous=$(fc -l -1); HISTCMD_previous=${HISTCMD_previous%%$'[\t ]'*}
  if [[ -z $HISTCMD_before_last ]]; then
    # Triggered by the initiation of history within the terminal
    echo "Terminal started."
  elif [[ $HISTCMD_before_last = "$HISTCMD_previous" ]]; then
    #  If a key was hit and the history has not advanced -- it was blank.
    echo "Blank submission"
  else
    # Any submission that changes the terminal history (either valid or invalid commands)
    echo "Not blank"
  fi
  HISTCMD_before_last=$HISTCMD_previous
}
PROMPT_COMMAND='detect_blank'

#### Flags
# You will have seen some of these with things like `rm -rf fileName` (remove recursively files (parent + children)
# Here's some more https://tldp.org/LDP/abs/html/options.html


# Here's another handy one:
mkdir -p /your/path/name/
# Which checks for a parent and then steps through each item in the directory and makes that folder if it doesn't exist.

#### Mega file creation for basic sites:
# This one is huge, so here's a link to the repo. https://github.com/Phoboes/mks

# Useage:

# `mks` -- Populates the current directory with a linked html/css/js

# `mks fileName` -- Makes a file named after the given arg (fileName), populates it with the above & opens it in the editor

# `mks fileName jq us d3` -- Does the above & additionally curls and links any number of generic JS libraries.

#### React module quick builds:

# Make a functional component/module of a given name and populate it with boilerplate code.
# Useage: `mkMod Name` creates `Name.js`. `mkMod components/Models/Model/Model` will make that file path if it doesn't exist and then plonk a `Model.js` inside.
mkMod () { 
  echo "-------------------------------------"
  if [[ -f "$1.js" ]];
    then
    echo "Duplicate found ($1.js). Aborting."
    echo "-------------------------------------"
    return
  fi
  if [[ $1 ]];
    then
    # Directory path minus last arg
    dir="$(dirname $1)"
    # check presence of folder, if not, make it
    mkdir -p "$dir"
    # Make a js file with the last arg in the directory path
    touch "$1.js"
    echo "$1.js has been created."
  fi

# Populate the file with boilerplate
  printf  "import React from 'react';

  const $(basename $1) = ( props ) => {
      return (
          <div>
            <p>$(basename $1).js</p>
            { props.children }
          </div>
      );
  }

  export default $(basename $1);" >> "$1.js"
  echo "-------------------------------------"
}

##### Bonus (make a lot of modules):

mkMods (){
    for f in "$@"; do
        mkMod "$f"
    done
}

# Useage:

# `mkMods components/Models/Models components/Models/Model/Model` will create the `components/Models/Model` path and populate both Models and Model with boilerplate JS files.
#### More:
# Here's a cheatsheet https://devhints.io/bash
