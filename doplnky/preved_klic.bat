@echo off
title prevod klice z verze linux 6.2 do verze pro PowerShell GUI
cls

set /p nazev_klice="nazev klice ? "

preved_klic.com %nazev_klice%
sleep 5
@echo on
