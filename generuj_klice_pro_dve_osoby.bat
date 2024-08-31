@echo off
title generator klice dve osoby
cls

set /p pocet="zadej pocet klicu (0-99) ?:

rem ----- tyto dva radky editovat ----------
set nazev_1=Jan_Novak-Patr_Cech-klic
set nazev_2=Petr_Cech-Jan_Novak-klic
rem ----------------------------------------

for /L %%G IN (1,1,%pocet%) DO (
if %%G LEQ 9 (
REM 0-9"
set sulfix='-0'
@echo %nazev_1%-0%%G
sleep 3
generuj_klic.com %nazev_1%-0%%G
sleep 3
@echo %nazev_2%-0%%G
generuj_klic.com %nazev_2%-0%%G
) else (
REM 10 a vic
set sulfix='-'
sleep 3
@echo %nazev_1%-%%G
generuj_klic.com %nazev_1%-%%G

sleep 3
@echo %nazev_2%-%%G
generuj_klic.com %nazev_2%-%%G
)
)

echo 'vse hotovo'
pause

