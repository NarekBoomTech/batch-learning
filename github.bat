@echo off

set "updateComponents=true"
set "updateCalendar=true"

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

git config --add --bool push.autoSetupRemote true
git add .
git commit -m %commitName%
git push
gh pr create --base staging -t %commitName% -b ""
@REM gh pr create -t %commitName% -b "" -f --base staging
@REM gh pr merge -m