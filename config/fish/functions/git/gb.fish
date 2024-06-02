set create_key "ctrl-n" 
set read_key   "enter" 
set update_key "ctrl-r" 
set delete_key "ctrl-x"

function fzf_branch_select 
    fzf --ansi --height 20% --border --prompt "Search branches: " --expect=$create_key,$read_key,$update_key,$delete_key
end

function gb --wraps="git branch"
    render_help $argv # -h (poor man's --help)

    set -l prompt_response (git branch --format="%(refname:short)" | fzf_branch_select)
    set key $prompt_response[1]
    set branch $prompt_response[2]

    switch $key
        case $create_key
            create_new_branch

        case $read_key
            git checkout $branch

        case $update_key
            rename_selected_branch $branch

        case $delete_key
            delete_selected_branch $branch

        case '*'
            echo "No valid option selected."
    end
end

function create_new_branch
    read -P "Enter new branch name: " new_branch
    if test -n "$new_branch"
        git checkout -b $new_branch
    else
        echo "Branch creation cancelled."
    end
end

function rename_selected_branch
    set -l branch $argv[1]

    set -l ticket           (infer_branch_ticket $branch)
    set -l branch_type      (infer_branch_type $branch)
    set -l branch_prefill   (echo "$branch_type/$ticket")
    echo (set_color yellow) "TODO: prefill input with inferred branch info: $branch_prefill"

    read -P "Enter new branch name for '$branch': " new_branch
    if test -z "$new_branch" -a -n "$default_rename"
        set new_branch $default_rename
    end
    
    if test -n "$new_branch"
        git branch -m $branch $new_branch
    else
        echo "Branch renaming cancelled."
    end
end


function delete_selected_branch
    set -l branch $argv[1]

    read -P "Are you sure you want to delete the branch '$branch'? (y/N): " confirmation
    if test "$confirmation" = "y"
        git branch -D $branch
    else
        gb # recurse (a poor mans return)
    end
end



function render_help
    if test "$argv" = "-h"
        echo " "
        render_key " $read_key: "  "Checkout the selected branch"
        render_key "$update_key: " "Rename the selected branch"
        render_key "$delete_key: " "Delete the selected branch"
        render_key "$create_key:"  " Create a new branch instead"
        echo " "
    end
end

# helper function to print keybinds
function render_key
    echo (set_color green) $argv[1] (set_color normal) $argv[2]
    return 0
end
