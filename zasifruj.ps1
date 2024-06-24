cls
# start of script ( store list existing variable names )
$ExistingVariables = Get-Variable | Select-Object -ExpandProperty Name

# v zahlavi spusteneho okna zobrazi informoce ( neco jako echo $0 v bash )
[string] $scriptName = pwd
#$scriptName += "\"
$scriptName += $MyInvocation.MyCommand.Name
$host.UI.RawUI.WindowTitle = $scriptName

# bude zobrazovat nahodne tipy, pri kazdem spusteni programu, vybere pomoci RND jede tip
# z $pole_tipy a zobrazi ho vyrazne zlute
$pole_tipy=@()
$pole_tipy += "Tip 1: Zaskrtnete nejake policko RadioButtonu a misto tlacitka [ OK ] stisknete klavesu [ Enter ], vysledek bude stejny"
$pole_tipy += "Tip 2: Soubory zip.exe a unzip.exe jsou starsi verze programu jako je napr. WinZip a daji se pouzivat zdarma"
$pole_tipy += "Tip 3: Soubory zip.exe a unzip exe, muzete nakopirovat do slozky C:\Windows\"
$pole_tipy += "Tip 4: Soubor 10_klicu.bat a 100_klicu.bat vygeneruji v adresari keys prislusni pocet novych klicu, ty si pak prejmenujte podle sebe"
$pole_tipy += "Tip 4: Soubor 10_klicu.bat a 100_klicu.bat vygeneruji v adresari keys prislusni pocet novych klicu, ty si pak prejmenujte podle sebe"
$pole_tipy += "Tip 5: Miximalni delka nazvu klice, archivu zip (vcetne pripony) je omezena na znaku na 73 znaku"
$pole_tipy += "Tip 5: Miximalni delka nazvu klice, archivu zip (vcetne pripony) je omezena na znaku na 73 znaku"
# schvalve 2x stejny, bude dvojnasobna sance na zobrazeni pri random[key]
$pole_tipy += "Tip 6: Nazvy klicu a archivu zip delsich nez 73 znaku bude program ignorovat az do doby jejich upravy,zkracenim jejich delky"
$pole_tipy += "Tip 6: Nazvy klicu a archivu zip delsich nez 73 znaku bude program ignorovat az do doby jejich upravy,zkracenim jejich delky"
$pole_tipy += "Tip 7: Nepouzivejne v nazvech (cehokoliv) znak mezera, znak mezera nahrazujte znakem podtrzitko"
$pole_tipy += "Tip 8: V adresari keys mejte jen soubory klicu, nevytvarejte vnem dalsi podadresare"
$pole_tipy += "Tip 9: Adresar keys neprejmenovavejte a nepresouvejte jinam, je pro beh programu nezbytni"
$pole_tipy += "Tip 10: Adresar keys ma univerzalni nazev a program ho nebude zahnovat do nabidky vyberu adresare"
$pole_tipy += "Tip 11: Autor nedoporucuje pouzivat diakritiku a nazvech klicu, adresaru a archivu"
$pole_tipy += "Tip 12: Hromada veci jak program pracuje byla jiz popsana ve vezi 6.2 pro Linux"
$pole_tipy += "Tip 13: Tato verze programu pro Windows vznikla hlavne z duvodu noveho grafickeho rozhrani a je velmi podobna verzi 6.2 pro Linux"
$pole_tipy += "Tip 14: Tato verze programu jiz nepouziva zadavani nazvu adresaru ale pracuje z jiz predem vytorenymi a obsahem naplnenymy adresary"
$pole_tipy += "Tip 15: Do adresare odkud byl spusten tento soubor vytvorte novy adresar, naplte ho vsim potrebnym a spuste program zasifruj.com"
$pole_tipy += "Tip 16: Do adresare odkud byl spusten tento soubor presunte sifrovany archiv napr. z prilohy email a spuste program desifruj.com"
$pole_tipy += "Tip 17: Takto zlute se pri kazdem spusteni programu bude zobrazovat nahodny tip ktery vam pomuze z pouzivanim programu"
$pole_tipy += "Tip 18: Zalohujte si slozku klicu tzn. adresar keys, prekopirovanim treba a flashdisk, vypalenim na cd-cko apod."
$pole_tipy += "Tip 19: Pokud chcete nektery adresar zazipovat 2x ale pomoci dvou ruznych klicu prejmenujte nejprve prvne vytvoreny archiv zip"
$pole_tipy += "Tip 20: Adresar ktery byl ji zazipovan a vznikl zneho soubor nazev_adrsare.zip, nebude jiz pri dalsim spusteni programu nabyzen znovu ne zpracovani"
$pole_tipy += "Tip 21: Paklize existuje napr. nazev slozky Adresar a znej vytvoreny archviv Adresar.zip, tak bude program pri dalsim spusteni obe polozky ignorovat"
$pole_tipy += "Tip 22: Paklize existuje napr. nazev archvivu Adresar.zip a znej je extrahovan adresar stejneho nazvu tzn Adresar, tak bude program pri dalsim spusteni obe polozky ignorovat"
$pole_tipy += "Tip 23: Nazvy souboru zip, adresaru (z vyjimkou adresare keys) a nazvy klicu dle libosti prejmenovavete, presouvejte a mazte"
$pole_tipy += "Tip 24: Soubory klicu urcenych pro starsi linuxovou verzi 6.2 nelze pouzit, tato verze pouziva jiny format klice"
$pole_tipy += 'Tip 25: paklize se program jak se rika "hryzne" pouzijte klavesou zkratku control+c'
$pole_tipy += "Tip 26: v pruzkumnikovy ve windows v adresari stimto programem mackejte klavesu F5 pro refresh"
$pole_tipy += "Tip 27: s cim si program opravdu neporadi to je diakritika, hotovy archiv si ale uz muzete pojmenovat jak chcete"
$pole_tipy += "Tip 28: Miximalni delka nazvu adresare je omezena na znaku na 69 znaku"
$pole_tipy += "Tip 28: Miximalni delka nazvu adresare je omezena na znaku na 69 znaku"
$pole_tipy += "Tip 29: Nazvy adrtesaru delsich nez 69 znaku bude program ignorovat az do doby jejich upravy, zkracenim jejich delky"
$pole_tipy += "Tip 29: Nazvy adrtesaru delsich nez 69 znaku bude program ignorovat az do doby jejich upravy, zkracenim jejich delky"
$pole_tipy += "Tip 30: jestlize by jste po havarii programu nasli nejaky soubor podivneho nazvu napr. seyubndlope.bat apod. tak ho vymazte"
$pole_tipy += "Tip 30: v menu RadioButton se da pohybovat take pomoci klavesy tabulator pak sipky nahoru a dolu a Enter pro potvrzeni vyberu, misto tlacitka [OK]"
#
$d_pole_tipy = $pole_tipy.Length
#echo $d_pole_tipy
#for ($x=0 ;$x -le $d_pole_tipy; $x++){ Write-host -ForegroundColor yellow $pole_tipy[$x] } # kontola
$tip_rnd = Get-Random -Minimum 0 -Maximum $d_pole_tipy
#echo $tip_rnd
Write-host -ForegroundColor yellow $pole_tipy[$tip_rnd]

# zkontlolovat 
#Remove-Variable sel_folder,nazev_adresare,all_folder_pouzitelne,d_all_folder_pouzitelne,all_folder,d_all_folder -ErrorAction SilentlyContinue
#Remove-Variable klice_2,delka_nazvu_jednoho_klice,d_klice_2, all_folder_2,delka_nazvu_jednoho_adresare,d_all_folder_2 -ErrorAction SilentlyContinue
#Remove-Variable matrix, nazev_klice, nazev_adresare_klice, klice, sel_file_key -ErrorAction SilentlyContinue

[string] $path = $pwd; $path += "\" # tady pozor $path ma tip System.Object, viz. $pwd.GetType()

#[string] $path = "c:\work\"

#echo $path

# jen adresare krome ./keys
#$all_folder = @(Get-ChildItem -Attributes Directory $pwd -Exclude "keys")
$all_folder= @(Get-ChildItem -Attributes Directory $path -Exclude "keys" -Name)
#$all_folder = @(Get-ChildItem $pwd -Include '/*' -Name)
#echo $all_folder # typ pole
$d_all_folder = $all_folder.Length #int32
#echo ($all_folder.Length)

# kontrola delky nazvy adresare, ne delsi nez 74
$all_folder_2 = @()
for ($aa2 = 0; $aa2 -le $d_all_folder; $aa2++) {
#echo $all_folder[$aa2]
$delka_nazvu_jednoho_adresare = $all_folder[$aa2].Length
#echo $delka_nazvu_jednoho_adresare
# ne delsi nazev klice nez 73 znaku
#if ($delka_nazvu_jednoho_adresare -lt 74) { # nove je maximalni delka adresare 69 znaku ( je +4 znaky pripona...)
if ($delka_nazvu_jednoho_adresare -lt 70) { # -lt 70 je < 70 (cili 69 max.)
#echo "pridat"
$all_folder_2 += $all_folder[$aa2]
}
}

$d_all_folder_2 = $all_folder_2.length - 1
#echo $d_all_folder_2"<<"

if ($d_all_folder_2 -eq 0) {
Write-host -ForegroundColor red "v ceste $path nebyli nalezeny zadne adresare ke zpracovani"
Write-host -ForegroundColor red "vytvor zde nejaky adresar, napln ho obsahem a spust tento program znovu"
Write-host -ForegroundColor yellow $pole_tipy[5]
echo "konec programu"
sleep 10
Exit
}

$all_folder_pouzitelne = @()

for ( $aa = 0; $aa -le ($d_all_folder_2 - 1); $aa++ ){
#echo $aa
#echo $all_folder[$aa]

$all_folder_zip_2 = $path
$all_folder_zip_2 += $all_folder_2[$aa]
#$all_folder_zip_2 +=".zip"
$all_folder_zip_2 +=".zip" # testovaci pouze
#echo $all_folder_zip_2"<"

# kontrola jestli k nalezenemu adresary (krome keys) existuje uz i vytvoreni archiv zip stejneho nazvu jako adresar
# aby nebylo mozne zipovani provadet znovu
if (-not (Test-Path $all_folder_zip_2)) {
# neexistuje adresar a soubor zip soucasne ( tzn.muze se pakovat, jijak by to bylo uz 2x )
# tento adresar se tedy prida do nabydky vyberu adresaru k zapakovani
$all_folder_pouzitelne += $all_folder_2[$aa]
#echo "adresar pradan do vyberu"
}
}

$d_all_folder_pouzitelne = $all_folder_pouzitelne.Length
#echo $d_all_folder_pouzitelne"<<<"

if ( $d_all_folder_pouzitelne -eq 0 ) {
Write-host -ForegroundColor red "v ceste '$path' sice byli nalezene adrsare ale ty jiz byl zazipovany drive, nelze znovu vytvorit stejny archiv znovu"
Write-host -ForegroundColor red "vytvor proto v ceste '$path' novy adresar a napln ho obsahem"
Write-host -ForegroundColor Yellow $pole_tipy[22]
echo "konec programu"
sleep 10
Exit 5
}

#for ( $bb = 0; $bb -le $d_all_folder_pouzitelne; $bb++ ){
#echo $all_folder_pouzitelne[$bb]
#}

echo "pocet adresaru pripravenych pro dalsi zpracovani: $d_all_folder_pouzitelne"

####################################################################
# grafika CheckBoxu vyberu adresare odsud 
####################################################################

$vyska_okna_y_adresare = (($d_all_folder_pouzitelne +1)*20) # *20 ( nejlepsi vychazi 20 vyska na 1 button)
#echo $vyska_okna_y_adresare

if ( $vyska_okna_y_adresare -gt 700 ) {
# opatreni pokud by bylo okno vetsi nez 800 v ose y aby uz se dal nezvetsovalo a nelezlo vertikane mimo obrazovku
# cili jestelize je vetsi jak 800 tak uz nech 800
$vyska_okna_y_adresare = 400
}
#echo $vyska_okna_y_adresare

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

#$objForm_adresare = New-Object System.Windows.Forms.Form # zalozi okno
$objForm_adresare = New-Object System.Windows.Forms.Form
# tady asi ma bejt na konci misto .Form nazev .objForm_adresare ^^^^
$objForm_adresare.Size = New-Object System.Drawing.Size(800, $vyska_okna_y_adresare) # a ted teprve definuje size
$objForm_adresare.Text = " VYBER ADRESARE"
$objForm_adresare.AutoScroll = $true # udela vertical i horizontal scroolbar funguje dobre, bez chyb
#$objForm.AutoScale = $true
$objForm_adresare.AutoSize = $true
$objForm_adresare.ForeColor = "Black"
#$objForm_adresare.ForeColor = "Magenta"
#$objForm_adresare.BackColor = "Black"
#$objForm_adresare.Font = 'Microsoft Sant Serif,13'
$objForm_adresare.Font = "Times New Roman',12"
#$objForm_adresare.ForeColor = "#032d5d"
#$objForm_adresare.ForeColor = "#ffffff"
#$objForm_adresare.ForeColor = "#f6f6f6"
#$objForm_adresare.VerticalScroll = $false
#$objForm_adresare.HorizontalScroll = $true
#$objForm_adresare.Size = New-Object System.Drawing.Size(800, 900) # 400, 900 velikost hlavniho okna
#$objForm_adresare.Size = New-Object System.Drawing.Size(800, $vyska_okna_y_adresare)
$objForm_adresare.StartPosition = "CenterScreen"
#

$sel_folder=""
$x_adresare=10
$y_adresare=5

# v cyklu vygeneruje pole RadioButtons podle poctu souboru klicu a adresari ./keys
$RadioButton_adresare=@()

for ($cc = 0; $cc -le ($d_all_folder_pouzitelne -1); $cc++) {
$RadioButton_adresare +=""
$RadioButton_adresare[$cc] = New-Object System.Windows.Forms.RadioButton # $RadioButton_adresare[0] uz je predem definovany zatim jako prazdny
$RadioButton_adresare[$cc].Location = New-Object System.Drawing.Size($x_adresare, $y_adresare) # vykresli RadioButton$RadioButton_adresare[$aa].Location = New-Object System.Drawing.Size($x_adresare, $y) # vykresli RadioButton
$y_adresare=( $y_adresare + 20 )
$RadioButton_adresare[$cc].Size = New-Object System.Drawing.Size(700, 20) # 700, 20
# kdyz je v adresari keys puze jeden klic tak ho rovnou zafajfkuje predem, jinak ne
#echo $d_all_folder_pouzitelne
#if ( $d_all_folder_pouzitelne -eq 1 ) { $RadioButton_adresare[$cc].Checked = $true }else{ $RadioButton_adresare[$cc].Checked = $false } 
if ($cc -eq 0 ) { $RadioButton_adresare[$cc].Checked = $true }else{ $RadioButton_adresare[$cc].Checked = $false}
$RadioButton_adresare[$cc].text = $all_folder_pouzitelne[$cc]
$objForm_adresare.controls.Add($RadioButton_adresare[$cc])
}

# ----------------ok adresar ------------------------------

$OKButton_adresare              = New-Object System.Windows.Forms.Button
#$OKButton.Location     = New-Object System.Drawing.Size(125, 810 )
$OKButton_adresare.Location     = New-Object System.Drawing.Size(337, ($y_adresare +20))
$OKButton_adresare.Size         = New-Object System.Drawing.Size(150, 30) # 150, 30
$OKButton_adresare.Text         = "OK"
#$OKButton.Enabled      = $false
$OKButton_adresare.Enabled      = $true
$OKButton_adresare.DialogResult = [System.Windows.Forms.DialogResult]::OK
$objForm_adresare.Controls.Add($OKButton_adresare)

$objForm_adresare.AcceptButton  = $OKButton_adresare 
$objForm_adresare.TopMost = $True

#$objForm_adresare.Controls | Where-Object { $PSItem -is [System.Windows.Forms.RadioButton] } | ForEach-Object { $PSItem.Add_Click( { If (-Not $OKButton_adresare.Enabled){ $OKButton_adresare.Enabled = $True} }) }
$objForm_adresare.Controls | Where-Object { $PSItem -is [System.Windows.Forms.RadioButton] } | ForEach-Object { $PSItem.Add_Click( { If (-Not $OKButton_adresare.Enabled){ $OKButton_adresare.Enabled = $True} }) }

$Form_adresare = $objForm_adresare.ShowDialog()
#echo $form"<"
#echo $v"<<"
#echo $PSItem"<<<"
#echo $objForm"<-"

#exit

for ($cc2 = 0; $cc2 -le $d_all_folder_pouzitelne; $cc2++) {
#echo $cc2
#echo $RadioButton[$cc2].AccessibilityObject.state
if ( $RadioButton_adresare[$cc2].AccessibilityObject.state -like "Checked, Focusable" ){
#echo $klice[$cc2]
#$sel_file=$key_file_name[$cc2]
#$sel_file_key=$klice[$cc2] # <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
$sel_folder = $all_folder_pouzitelne[$cc2]
break
}
}

if ( $sel_folder.Length -eq 0 ){
Write-host -ForegroundColor red "nebyl vybran zadny adesar, konec programu"
sleep 3
Exit 1
}

$nazev_adresare = $sel_folder
echo "vybran adresar: $nazev_adresare"
sleep 3

#############################################
# vyber klice 
############################################

$nazev_adresare_klice = "./keys"

#$nazev_adresare_klice = "./keys_test"
$nazev_adresare_klice_exist = Test-Path $nazev_adresare_klice
if ($nazev_adresare_klice_exist -clike "False"){
Write-host -ForegroundColor red "neni adresar $nazev_adresare_klice"
Write-host -ForegroundColor yellow $pole_tipy[8]
echo "konec programu"
sleep 5
exit
}

# vyber souboru klice pres RadioButtons GUi pro novou versi emailkody pro PowerShell
#$klice = @(Get-ChildItem $nazev_adresare_klice -Include '*.txt' -Name)
$klice = @(Get-ChildItem $nazev_adresare_klice -Name)
$d_klice = $klice.length - 1
#echo $d_klice

# zde kontrola delky nazvu klice ne delsi nez 73 znaku
$klice_2 = @()
for ($aa2 = 0; $aa2 -le $d_klice; $aa2++ ) {
#echo $klice[$aa2]
$delka_nazvu_jednoho_klice = $klice[$aa2].Length
#echo $delka_nazvu_jednoho_klice
# ne delsi nazev klice nez 73 znaku
if ($delka_nazvu_jednoho_klice -lt 74 ) {
#echo "pridat"
$klice_2 += $klice[$aa2]
}
}

$d_klice_2 = $klice_2.length - 1
#echo $d_klice_2"<<"


if ($d_klice_2-clike -1) {
Write-host -ForegroundColor red "zadne klice v adresari $nazev_adresare_klice"
if ($klice.Length -eq $klice_2.Length) {Write-host -ForegroundColor yellow $pole_tipy[3]}
if ($klice.Length -gt $klice_2.Length) {Write-host -ForegroundColor yellow $pole_tipy[5]}
echo "konec programu"
sleep 3
Exit
}

$vyska_okna_y_klice = (($d_klice_klice_2 +1)*20) # *20 ( nejlepsi vychazi 20 vyska na 1 button)
#echo $vyska_okna_y

if ( $vyska_okna_y_klice -gt 700 ) {
# opatreni pokud by bylo okno vetsi nez 800 v ose y aby uz se dal nezvetsovalo a nelezlo vertikane mimo obrazovku
# cili jestelize je vetsi jak 800 tak uz nech 800
$vyska_okna_y_klice = 700
}
#echo $vyska_okna_y

#Add-Type -AssemblyName System.Windows.Forms
#[System.Windows.Forms.Application]::EnableVisualStyles()

$objForm_klice = New-Object System.Windows.Forms.Form
$objForm_klice.Text = "  VYBER SOUBORU KLICE"
$objForm_klice.AutoScroll = $true # udela vertical i horizontal scroolbar funguje dobre, bez chyb
#$objForm_klice.AutoScale = $true
$objForm_klice.AutoSize = $true
$objForm_klice.ForeColor = "Black"
#$objForm_klice.ForeColor = "Magenta"
#$objForm_klice.BackColor = "Black"
#$objForm_klice.Font = 'Microsoft Sant Serif,13'
$objForm_klice.Font = "Times New Roman',12"
#$objForm_klice.ForeColor = "#032d5d"
#$objForm_klice.ForeColor = "#ffffff"
#$objForm_klice.ForeColor = "#f6f6f6"
#$objForm_klice.VerticalScroll = $false
#$objForm_klice.HorizontalScroll = $true
#$objForm_klice.Size = New-Object System.Drawing.Size(800, 900) # 400, 900 velikost hlavniho okna
$objForm_klice.Size = New-Object System.Drawing.Size(800, $vyska_okna_y_klice) # 400, 900 velikost hlavniho okna
$objForm_klice.StartPosition = "CenterScreen"
#
$sel_file_key=""
$x_klice=10
$y_klice=5

# v cyklu vygeneruje pole RadioButtons podle poctu souboru klicu a adresari ./keys
$RadioButton_klice=@()

for ($aa4 = 0; $aa4 -le $d_klice_2; $aa4++) {
$RadioButton_klice+=""
$RadioButton_klice[$aa4] = New-Object System.Windows.Forms.RadioButton # $RadioButton[0] uz je predem definovany zatim jako prazdny
$RadioButton_klice[$aa4].Location = New-Object System.Drawing.Size($x_klice, $y_klice) # vykresli RadioButton
$y_klice=( $y_klice + 20 )
$RadioButton_klice[$aa4].Size = New-Object System.Drawing.Size(700, 20) # 700, 20
# kdyz je v adresari keys puze jeden klic tak ho rovnou zafajfkuje predem, jinak ne
#if ( $d_klice_2 -eq 0 ) { $RadioButton_klice[$aa].Checked = $true }else{ $RadioButton_klice[$aa4].Checked = $false }
if ($aa4 -eq 0 ) { $RadioButton_klice[$aa4].Checked = $true }else{ $RadioButton_klice[$aa4].Checked = $false}
$RadioButton_klice[$aa4].text = $klice_2[$aa4]
$objForm_klice.controls.Add($RadioButton_klice[$aa4])
}

$info_1_klice = "pocet klicu "
$info_1_klice += "v adresari keys: "
#$info_1_klice += $nazev_adresare_klice
#$info_1_klice +=" je "
$info_1_klice +=$RadioButton_klice.Length
echo $info_1_klice

# ----------------------------------------------

$OKButton_klice              = New-Object System.Windows.Forms.Button
#$OKButton_klice.Location     = New-Object System.Drawing.Size(125, 810 )
$OKButton_klice.Location     = New-Object System.Drawing.Size(337, ($y_klice +20) )
$OKButton_klice.Size         = New-Object System.Drawing.Size(150, 30) # 150, 30
$OKButton_klice.Text         = "OK"
#$OKButton_klice.Enabled      = $false
$OKButton_klice.Enabled      = $true
$OKButton_klice.DialogResult = [System.Windows.Forms.DialogResult]::OK
$objForm_klice.Controls.Add($OKButton_klice)

$objForm_klice.AcceptButton  = $OKButton_klice
$objForm_klice.TopMost = $True
$objForm_klice.Controls | Where-Object { $PSItem -is [System.Windows.Forms.RadioButton] } | ForEach-Object { $PSItem.Add_Click( { If (-Not $OKButton_klice.Enabled){ $OKButton_klice.Enabled = $True} }) }

$Form_klice = $objForm_klice.ShowDialog()
#echo $form"<"
#echo $v"<<"
#echo $PSItem"<<<"
#echo $objForm"<-"

#exit

for ($cc2 = 0; $cc2 -le $d_klice_2; $cc2++) {
#echo $cc2
#echo $RadioButton[$cc2].AccessibilityObject.state
if ( $RadioButton_klice[$cc2].AccessibilityObject.state -like "Checked, Focusable" ){
#echo $klice[$cc2]
#$sel_file=$key_file_name[$cc2]
$sel_file_key=$klice_2[$cc2]
break
}
}

if ( $sel_file_key.Length -eq 0 ){
Write-host -ForegroundColor red "nebyl vybran zadny soubor klice, konec programu"
sleep 3
Exit 1
}

$nazev_klice = "$nazev_adresare_klice/$sel_file_key"
echo "byl vybran soubor klice $nazev_klice"
#sleep 3


##############################################
# sha1sum vybraneho klice
##############################################

$zvoleny_klic_sha = Get-FileHash -Path $nazev_klice -Algorithm SHA1
$sha = $zvoleny_klic_sha.Hash
$d_sha = $sha.Length
$sha3=""
for ($xx1 = 0; $xx1 -le $d_sha -1; $xx1++ ) {
$znak_sha = $sha.Substring($xx1,1)
$znak_sha_low = $znak_sha.ToLower() 
# funkce dela z velkejch pismen maly, jako ma linux
$sha3 += $znak_sha_low
}
echo "sha1sum vybraneho klice: $sha3"

# datum se zapise do file comentu zipu
#$zip_date="datum vytvoreni archivu: "
$zip_date = "{0:dd.MM.yyyy HH:mm}" -f (Get-Date)
echo "datum vytvoreni archivu: $zip_date"
sleep 10

######################################
# nacteni zvoleneho klice do matrixu
######################################

# Remove-Variable matrix, nazev_klice -ErrorAction SilentlyContinue
$matrix=[System.Collections.ArrayList]::new()

# prazdny matrix 62 vodorovne a 126 svisle
for ( $dd2 = 0; $dd2 -le 125; $dd2++ ) {
#delka 62
$matrix.Add(@("","","","","","","","","","","","","","","","","","","","","","","","","","","","","",
"","","","","","","","","","",
"","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","")) > $null
# bez > $null vypise 0-125 radek
}

$poc=1

$stream_reader_1 = [System.IO.StreamReader]::new($nazev_klice)

#while (-not $stream_reader.EndOfStream) {
for ( $dd = 0; $dd -le 125; $dd++){
for ( $ee = 10; $ee -le 71; $ee++){
$line_read = ($stream_reader_1.ReadLine()) 

$in = ""

$in = '$matrix'
$in += "["
$in += $dd
$in += "]["
$in += $ee
$in += ']="'
$in += $matrix[$dd][$ee]
$in += $line_read
$in +='"'
echo $in
$matrix[$dd][$ee]=$line_read
$poc++
}
}

$stream_reader_1.close()

######################################################
# zde vytvoreni souboru filecomment
######################################################

# $sel_folder, $sel_file_key

$reference_na_heslo=""
$heslo_pro_zazipovani=""

for ($ff = 0; $ff -le 125; $ff++) {
#echo $ff
$rnd_num = Get-Random -Minimum 10 -Maximum 71
#echo $rnd_num
$reference_na_heslo += [string] $rnd_num
$heslo_pro_zazipovani += $matrix[$ff][$rnd_num]
}

Write-host -ForegroundColor red $reference_na_heslo
Write-host -ForegroundColor cyan $heslo_pro_zazipovani
sleep 5


# minimalne 2 souboru musej bej v adresari aby by do ceho zapsta file comment
# konktolni soucet souboru klice se zde uz neprovani, nejsou na to zadne nastroje v PS
$minimalni_obsah_adresare = @(Get-ChildItem -Path $sel_folder -Name)

#echo $minimalni_obsah_adresare
$d_minimalni_obsah_adresare = $minimalni_obsah_adresare.Length
#echo $d_minimalni_obsah_adresare


$file_prazdny_nazev_1="SmazMe-1.txt"
$file_prazdny_nazev_2="SmazMe-2.txt"
$text_prazdny_soubor="tento soubor vymaz"
$smazat_file_prazdny_nazev_1=0
$smazat_file_prazdny_nazev_2=0


if ( $d_minimalni_obsah_adresare -eq 0 ){
# kdyz je 0 tak vytvor dva soubory
Set-Content -Path "$sel_folder\$file_prazdny_nazev_1" -Encoding ASCII -Value $text_prazdny_soubor
$smazat_file_prazdny_nazev_1=1
sleep 1
#echo "1"
Set-Content -Path "$sel_folder\$file_prazdny_nazev_2" -Encoding ASCII -Value $text_prazdny_soubor
$smazat_file_prazdny_nazev_2=1
sleep 1
#echo "2"
}elseif ( $d_minimalni_obsah_adresare -eq 1 ){
# kdyz uz jedn je tak knemu vytvor jeste jeden
Set-Content -Path "$sel_folder\$file_prazdny_nazev_1" -Encoding ASCII -Value $text_prazdny_soubor
$smazat_file_prazdny_nazev_1=1
sleep 1
#echo "1"
}else{
#echo "nic nevytvarim"
}

# vytvoreni souboru file comment

# smaze stary soubor file comment paklize existuje
$filecomment_name="FileComment.txt"
Remove-Item -Path "$path$filecomment_name" -Force -ErrorAction SilentlyContinue
sleep 1

############################################
# sesteveni obsahu souboru FileComment.txt
############################################
$zip_file_comment=@() # musi bejt typ pole, jinak dava radky za sebe, misto pod sebe
$zip_file_comment+=$reference_na_heslo # zustava na prvni radku
# tady zmena pridano shasum a datum na jeden radek dohromady
$zip_file_comment+=$sel_file_key # radek 2
# radek 3 sha klice, datum zip
$zip_file_comment_radek_3 = "Sha1SumKeyFile: " # tohle pak bude hledat na radku desifruj.exe
$zip_file_comment_radek_3 += $sha3
$zip_file_comment_radek_3 += " DateZipFile: " # tohle pak bude hledat na radku desifruj.exe
$zip_file_comment_radek_3 += $zip_date
#echo $zip_file_comment_radek_3
$zip_file_comment += $zip_file_comment_radek_3
#sleep 10

Set-Content -Path "$path$filecomment_name" -Encoding ASCII -Value $zip_file_comment
sleep 1

# test jestli by spravne vytvorem soubor file comment
$kontrola_file_comment=@()
$kontrola_file_comment+= Get-Content "$path$filecomment_name" -ErrorAction SilentlyContinue
$d_kontrola_file_comment=$kontrola_file_comment.Length
#echo $d_kontrola_file_comment

if ( $d_kontrola_file_comment -ne 3 ){ # tady pozor pri zmene poctu radku ( aktualne 3 radky )
Write-host -ForegroundColor red "chyba programu, nenalezen soubor $path$filecomment_name"
echo "konec programu"
sleep 10
Exit 1
}

# test exist zip.exe
$cmd_zip = ("zip.exe")
if (-not (Test-Path "$path$cmd_zip")){
Write-host -ForegroundColor red "chyba programu, nenalezen soubor "$path$cmd_zip"
echo "konec programu
sleep 10
exit 1
}

# zipovani
$archiv_zip_nazev=$sel_folder
$archiv_zip_nazev+=".zip"
echo $archiv_zip_nazev

# & $rar "a" "-r" "-m5" "-hp$heslo" "-p$heslo" "$path_email$hledej_datum.rar" "$path_email$hledej_datum\" # zapakovani
# & $cmd_zip "-r" "-9" "-y "-UN=UTF8" "-P " $heslo_pro_zazipovani " -c < $filecomment_name " $archiv_zip_nazev
# zip -r -9 -P abcdefg -c < FileComment.txt abcdefg.zip babeta_kozy
#  ^----  funguje
# =" -c < 'zip_file_comment.txt' " bash
#& $cmd_zip "-r" "-9" "-P" " $heslo_pro_zazipovani" "$archiv_zip_nazev" "$sel_folder"
#& $cmd_zip "-r" "-9" "-P" "$heslo_pro_zazipovani" "$archiv_zip_nazev" "$sel_folder" FUNGUJE
#& $cmd_zip "-r" "-9" "-P" "$heslo_pro_zazipovani" "-c < " "$filecomment_name" "$archiv_zip_nazev" "$sel_folder"
#& $cmd_zip "-r" "-9" "-P" "$heslo_pro_zazipovani" "-c <" "$filecomment_name" "$archiv_zip_nazev" "$sel_folder"
# > & $cmd_zip "-r" "-9" "-P" "$heslo_pro_zazipovani" " -c < " "$filecomment_name" "$archiv_zip_nazev" "$sel_folder" SKORO FUNGUJE
# & $cmd_zip "-r" "-9" "-P" "$heslo_pro_zazipovani" " -c < $filecomment_name" " $archiv_zip_nazev" "$sel_folder"
#& $cmd_zip "-r" "-9" "-P" "$heslo_pro_zazipovani" " -c < $filecomment_name" " $archiv_zip_nazev" "$sel_folder"
#& "$cmd_zip -r -9 -P $heslo_pro_zazipovani -c < $filecomment_name $archiv_zip_nazev $sel_folder"
#& $cmd_zip "-r" "-9" "$archiv_zip_nazev" "$sel_folder"
#& $cmd_zip "-r" "-9" "-P " 'abcd ' "$archiv_zip_nazev" "$sel_folder"
# ^------------ funguje


# po mnoha pokusech zvolen radeji jinej zpusob pres batku 
# nechtel brat parametr " -c < " ale jinak v cmd.exe funguje dobre ?, treba acasem
$o1=@()
$uv='"'
$o1+="@echo off"
$o1+="verify on"
#$o1+="zip.exe -r -9 -P "+$heslo_pro_zazipovani+" -c < "+$filecomment_name+" "+$archiv_zip_nazev+" "+$sel_folder
$o1+="zip.exe -r -9 -P "+$heslo_pro_zazipovani+" -c < "+$filecomment_name+" "+$uv+$archiv_zip_nazev+$uv+" "+$uv+$sel_folder+$uv
# pridany uvozovky, kdyz jsou v nazvu mezery
$o1+="sleep 5"
$o1+="unzip.exe -t -P "+$heslo_pro_zazipovani+" "+$uv+$archiv_zip_nazev+$uv
$o1+="@echo on"

#echo $o1
#$file_bat="zip.bat"
# zde novinka
# podle linux stamp dela nahodnej nazev souboru
# nakonec prida jeste jeden znak, protoze stamp se meni po vterine, coz je dlouho
[string] $stamp = [DateTimeOffset]::Now.ToUnixTimeseconds()
$d_stamp = $stamp.Length
$file_bat=""
for ($aa5 = 10; $aa5 -ge 1; $aa5-- ){
$cast_stamp_int = 97
$cast_stamp=$stamp.Substring( ($d_stamp -$aa5), 1)
$cast_stamp_int += [int32] $cast_stamp
$file_bat += [char] $cast_stamp_int
}
$rnd_znak = Get-Random -Minimum 97 -Maximum 122 # a=97, z=122
$file_bat += [char] $rnd_znak
$file_bat += ".bat"
#echo $file_bat
#
Set-Content -Path "$path$file_bat" -Encoding ASCII -Value $o1
sleep 1
#& "$o1"
#$run_o1=("./zip.bat")
$run_o1=("./$file_bat")
#echo $run_o1
& $run_o1
# bacha na mezery v nazvech !! ( vyreseno pridanim $uv ), co nefunguje vubec je cestina !!!

sleep 1

# odstaneni vsech souboru ktere byli vytvoreny, aby nezustaval nikde bordel
Remove-Item -Path "$path$filecomment_name" -Force -ErrorAction SilentlyContinue
sleep 1

Remove-Item -Path "$path$file_bat" -Force -ErrorAction SilentlyContinue # tady taky pak zmena
sleep 1

if ( $smazat_file_prazdny_nazev_1 -eq 1 ) {
Remove-Item -Path "$sel_folder\$file_prazdny_nazev_1" -Force -ErrorAction SilentlyContinue
sleep 1
}

if ( $smazat_file_prazdny_nazev_2 -eq 1 ) {
Remove-Item -Path "$sel_folder\$file_prazdny_nazev_2" -Force -ErrorAction SilentlyContinue
sleep 1
}

echo "hotovo"

# End of script ( remove new variables )
$NewVariables = Get-Variable | Select-Object -ExpandProperty Name | Where-Object {$ExistingVariables -notcontains $_ -and $_ -ne "ExistingVariables"}
if ( $NewVariables ) {
#Write-Host "vymazu vsechny tyto preomenne: `n`n$NewVariables" # to "n$" tady dela newline
#Write-Host "vymazu vsechny tyto promenne: `n`n$NewVariables" # 'n'n$ - nalepeny na sobe neda newline | `n` n$ ( nedela newline )
Remove-Variable $NewVariables
} else {
#Write-Host "No new variable to remove !"
}

sleep 10 # kvuli test, jak dopadnul
