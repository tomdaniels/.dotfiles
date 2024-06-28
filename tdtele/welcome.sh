#!/bin/bash
message="Hello, $USER."
opts=("homer" "elephant2" "catfence" "-r")
opt="${opts[RANDOM % ${#opts[@]}]}"

cowsay -f "$opt" "$message" | lolcat
