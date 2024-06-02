function gca --wraps="git commit"
    printf "%sAre you sure you want to amend the last commit? (Y/n)%s\n" (set_color yellow) (set_color normal)
    read -l -n 1 confirmation

    if test "$confirmation" = "Y" -o "$confirmation" = "y"
        git commit --amend
    else
        echo "Cancelled"
    end
end
