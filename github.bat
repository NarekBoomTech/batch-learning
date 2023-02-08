@echo off
set commitName="Update boom-calendar"
set prTitle="Update boom-calendar"

call npm i is-prime

git config --add --bool push.autoSetupRemote true
git add .
git commit -m %commitName%
git push
gh pr create -t %prTitle% -b ""
gh pr merge -m