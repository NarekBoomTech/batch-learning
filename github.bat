@echo off

set "updateComponents=true"
set "updateCalendar=true"
set baseBranch="staging"

if "%updateComponents%" == "true" if "%updateCalendar%" == "true" (
    ::call npm update boom-components boom-calendar
    set commitName="Update boom-calendar and boom-components"
)

if "%updateComponents%" == "true" if "%updateCalendar%" == "false" (
    ::call npm update boom-components
    set commitName="Update boom-components"
)

if "%updateComponents%" == "false" if "%updateCalendar%" == "true" (
    ::call npm update boom-calendar
    set commitName="Update boom-calendar"
)

if "%updateComponents%" == "false" if "%updateCalendar%" == "false" (
    echo "Exit"
    exit
)

set commitName="Test 2"

git config --add --bool push.autoSetupRemote true
git add .
git commit -m %commitName%
git push
gh pr create -t %commitName% -b ""
gh pr merge -m