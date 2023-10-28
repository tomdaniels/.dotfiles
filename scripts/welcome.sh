#!/bin/bash

message="Hello, $USER!"
animals=("elephant2" "turtle" "catfence" "psychiatrichelp") 
random_animal="${animals[RANDOM % ${#animals[@]}]}"

cowsay -f "$random_animal" "$message" | lolcat
