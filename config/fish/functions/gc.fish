function gc --wraps='git commit'
    set branch_name (git rev-parse --abbrev-ref HEAD)
    set ticket (string match -r "(?:PKB)-[^-]*" $branch_name)
    set inferred_branch_type (string split '/' $branch_name)[1]
    
    set branch_type ""
    set commit_message ""
    switch (count $argv)
        case 1
            # if there's no "/" in the branch we can't infer the name, so both arguments are required.
            if test -z (string match -r '/' $branch_name); 
                throw "Unable to infer branch type for a semantic commit, please supplu both arguments. gc [branch_type] [commit_message]"
                return 1
            end

            set commit_message $argv[1]
            set branch_type $inferred_branch_type
        case 2
            set branch_type $argv[1]
            set commit_message $argv[2]
        case '*'
            throw "Incorrect arguments, try: gc [branch_type] [commit_message] or gc [commit_message]"
            return 1
    end
    
    if test -z "$commit_message"
        throw "Missing commit message. Valid format is: gc [branch_type] [commit_message] or gc [commit_message]"
        return 1
    end
    
    # Check if either branch_type is empty or branch name doesn't contain '/'
    if test -z "$branch_type"
        throw "Missing branch type. If your branch is not prefixed correctly please supply the arguments: gc [branch_type] [commit_message]"
        return 1
    end
    
    if test -z "$ticket"
        git commit -m "$branch_type: $commit_message"
        return 0
    end
    git commit -m "$branch_type($ticket): $commit_message"
end

function throw
    printf "%sInvalid Format%s:\n" (set_color red) (set_color normal)
    echo $argv[1]     
    return 1
end
