
powershell_ise.exe ps2exe.ps1

pause


Invoke-ps2exe -inputFile ..\..\desifruj.ps1 -outputFile ..\..\desifruj.exe -x86 -STA -version 1.1 -title "desifruj.exe" -iconFile ..\..\icon.ico
Invoke-ps2exe -inputFile ..\..\zasifruj.ps1 -outputFile ..\..\zasifruj.exe -x86 -STA -version 1.1 -title "zasifruj.exe" -iconFile ..\..\icon.ico
Invoke-ps2exe -inputFile ..\..\100_klicu.ps1 -outputFile ..\..\100_klicu.com -x86 -STA -version 1.1 -title "100_klicu.com"
Invoke-ps2exe -inputFile ..\..\10_klicu.ps1 -outputFile ..\..\10_klicu.com -x86 -STA -version 1.1 -title "10_klicu.com"
Invoke-ps2exe -inputFile ..\..\generuj_klic.ps1 -outputFile ..\..\generuj_klic.com -x86 -STA -version 1.1 -title "generuj_klic.com"
Invoke-ps2exe -inputFile ..\..\new_folder.ps1 -outputFile ..\..\new_folder.com -x86 -STA -version 1.1 -title "new_folder.com"
Invoke-ps2exe -inputFile ..\..\sha1sum_all_zip_files_in_this_folder.ps1 -outputFile ..\..\sha1sum_all_zip_files_in_this_folder.com -x86 -STA -version 1.1 -title "sha1sum_all_zip_files_in_this_folder.com"
Invoke-ps2exe -inputFile ..\..\zobraz_tip.ps1 -outputFile ..\..\zobraz_tip.com -x86 -STA -version 1.1 -title "zobraz_tip.com"












