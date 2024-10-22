@echo off
del _TREE_folder_final_mega_test.txt
sleep 1
date /t > C:\Users\DELL\Documents\ps1\_GUI\Sifrovaci_program_GUI_PowerShell_verze_1.1\doplnky\testovani_hesla\final_mega_test\_TREE_folder_final_mega_test.txt
time /t >> C:\Users\DELL\Documents\ps1\_GUI\Sifrovaci_program_GUI_PowerShell_verze_1.1\doplnky\testovani_hesla\final_mega_test\_TREE_folder_final_mega_test.txt
tree /F /A C:\Users\DELL\Documents\ps1\_GUI\Sifrovaci_program_GUI_PowerShell_verze_1.1\doplnky\testovani_hesla\final_mega_test\ >> C:\Users\DELL\Documents\ps1\_GUI\Sifrovaci_program_GUI_PowerShell_verze_1.1\doplnky\testovani_hesla\final_mega_test\_TREE_folder_final_mega_test.txt
@echo on
REM pause
