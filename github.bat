@echo off
set commitName="My commit name"
set prTitle="Pull request name"

git config --add --bool push.autoSetupRemote true
git add .
git commit -m %commitName%
git push
gh pr create -t %prTitle% -b ""