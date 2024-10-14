@echo off
set celkem=10
for /L %%G IN (1,1,%celkem%) DO (
echo %%G
new_folder.com
sleep 2
)

pause
