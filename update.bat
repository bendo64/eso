@echo off
echo Updating game...
git fetch --all
git reset --hard origin/main
echo Update complete.
pause

