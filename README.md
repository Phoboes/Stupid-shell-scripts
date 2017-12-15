## Generic aliases:

#### Nomination aliases for programs:
```sh
alias subl='open -a "Sublime Text"'
```
Open sublime or open a file with sublime text (substitute to whatever).
Useage:

`subl` -- Opens sublime text

`subl ./yourFilePath` -- open anything from that given directory in sublime

#### Opening specific files with an alias 
This one targets the bash_profile with atom:
```sh
alias bp="atom ~/.bash_profile"
```

#### Alias navigation utilities
```sh
alias dt='cd ~/Desktop'
alias hw="cd ~/Desktop/Teaching/Homework\ folders/WDi23-Homework/" # <- Change this directory to match your local machine.
```

#### Alias multiple commands
This one is handy for establishing new rails projects:
```sh
alias rare="bundle && rake db:create && rake db:migrate && rake db:seed && subl . && rails s" # replace 'subl' with 'atom', or your preferred editor
```

## Scripts: 

#### Simpler SimpleHTTPServer:
Echos the actual command (I always forget the casing) and listens for a port. If no port is nominated, it goes to default
```sh
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
```

Useage:

`pServe` -- default Python server

`pServer 3000` -- A python server on localhost:3000

#### Say command mischief (for Katie)
Repeat a given string N number of times, spaced N seconds apart.
```sh
say_repeat () {
  for ((i=1; i<=$1; i++))
  do
    say $3
    sleep $((i * $2))
  done
}
```

Useage: 

`say_repeat 10 1 'I'm repeating!'` -- Repeat "I'm repeating!" 10 times, spaced 1 second apart

#### Mega file creation for basic sites:
[This one is huge, so here's a link to the repo.](https://github.com/Phoboes/mks)

Useage:

`mks` -- Populates the current directory with a linked html/css/js

`mks fileName` -- Makes a file named after the given arg (fileName), populates it with the above & opens it in the editor

`mks fileName jq us d3` -- Does the above & additionally curls and links any number of generic JS libraries.
