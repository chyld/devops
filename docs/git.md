# Git Commands

## Squashing 1

- `git merge --squash --no-commit target_branch`
- `git commit -m "squashed commits"`
- Squashes the target branch as it is being merged into the source
- Leaves all files still checked out, so you can see what changed

## Squashing 2

- `git reset HEAD~~~`
- `git commit -m "squashed commits"`
- Moves the HEAD pointer back 3 commits

