@echo off
set commitName="Update boom-calendar"
set prTitle="Update boom-calendar pull request"

call npm i --prefix ../batch-learning is-prime

git config --add --bool push.autoSetupRemote true
git add .
git commit -m %commitName%
git push
gh pr create -t %prTitle% -b ""
gh pr merge -m