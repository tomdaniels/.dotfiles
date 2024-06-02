# small utility for my git helper scripts
function infer_branch_type
    set branch_name $argv[1]
    set inferred_branch_type (string split '/' $branch_name)[1]
    echo $inferred_branch_type
end
