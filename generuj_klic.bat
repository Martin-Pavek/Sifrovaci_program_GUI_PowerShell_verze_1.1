@echo off
title generator klice
cls
dir keys
set /p nazev_klice="nazev klice ? "
powershell -file ./generuj_klic.ps1 %nazev_klice%
REM generuj_klic.com %nazev_klice%
sleep 1
@echo on
