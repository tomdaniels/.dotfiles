function cherries
    # Check out the master branch
    git checkout master

    # Pull the latest changes
    git pull --rebase

    # Check if the master branch has any new commits
    set local_status (git status -uno)
    if string match -q "*Your branch is up to date*" "$local_status"
        echo "The master branch is already up to date. No changes to cherry-pick."
        return 0
    end

    # Get the list of new commits
    set new_commits (git log origin/master..master --pretty=format:"%h %s")

    echo "$new_commits"

    # If there are no new commits, return early
    if test -z "$new_commits"
        echo "No new commits to cherry-pick."
        return 0
    end

    # Use fzf to select commits
    set selected_commits (git log origin/master..master --pretty=format:"%h %s" | fzf -m --height 20%  --header="Select commits to cherry-pick" --preview="echo {} | cut -d' ' -f1 | xargs git show --pretty=oneline --abbrev-commit")

    # If no commits were selected, return early
    if test -z "$selected_commits"
        echo "No commits selected for cherry-pick."
        return 0
    end

    # Extract the SHA hashes of the selected commits
    set shas (echo "$selected_commits" | awk '{print $1}')

    # Check out the wsl branch
    git checkout wsl

    # Cherry-pick the selected commits
    for sha in $shas
        git cherry-pick $sha
    end
end
