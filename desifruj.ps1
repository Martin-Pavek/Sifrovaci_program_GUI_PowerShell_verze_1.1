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


# NAZEV KLICE PRO UNPACK JE VE FILE KOMENTARI NENI POTREBA ZADAVAT RUCNE !!!!!!!

# tady pak este poctive vymazat vsech promenny a dat na zacatek
#Remove-Variable d_all_file_zip_2,all_file_zip_2,sel_folder,nazev_adresare,all_folder_pouzitelne,d_all_folder_pouzitelne,all_folder,d_all_folder -ErrorAction SilentlyContinue
#Remove-Variable vybrany_zip, cmd_unzip, cmd_output, d_cmd_output, radek_list, nalezeno -ErrorAction SilentlyContinue

[string] $path = $pwd; $path += "\" # tady pozor $path ma tip System.Object, viz. $pwd.GetType()

#[string] $path = "c:\work\"

#echo $path

# hleda vsechny soubor *.zip a cete $path
$all_file_zip = @(Get-ChildItem $path -Include '*.zip' -Name)
$d_all_file_zip = $all_file_zip.Length #int32
#echo $d_all_file_zip"<"

# kontrola delky nazvy zipu, ne delsi nez 74 znaku, POZOR TADY ALE PLATI ZE CELKOVA DELKA VCETNE PRIPONY !!! ( nezapomenout )
# 123456789012345678901234567890123456789012345678901234567890123456789.rar
# ^^^^--- maximalni mozna delka souboru vcetne pripony, ukazka zde
# 123456789012345678901234567890123456789012345678901234567890123456789x.rar
#                                          tohle uz neveme ------------^
$all_file_zip_2 = @()

for ($aa2 = 0; $aa2 -le $d_all_file_zip; $aa2++) {
#echo $all_file_zip[$aa2]
$delka_nazvu_jednoho_zipu = $all_file_zip[$aa2].Length
#echo $delka_nazvu_jednoho_zipu
# ne delsi nazev klice nez 73 znaku
if ($delka_nazvu_jednoho_zipu -lt 74) {
#echo "pridat"
$all_file_zip_2 += $all_file_zip[$aa2]
}
}

$d_all_file_zip_2 = $all_file_zip_2.length - 1
#echo $d_all_file_zip_2"<<"

if ($d_all_file_zip_2 -eq 0) {
Write-host -ForegroundColor red "v ceste $path nebyli nalezeny soubory *.zip ke zpracovani"
Write-host -ForegroundColor yellow $pole_tipy[5]
echo "konec programu"
sleep 10
Exit
}

$all_zip_pouzitelne = @()

for ( $aa = 0; $aa -le ($d_all_file_zip_2 -1 ); $aa++ ){
#echo $aa
#echo $all_file_zip[$aa]

$folder_zip = $path
$folder_zip += $all_file_zip_2[$aa].Substring(0,$all_file_zip_2[$aa].Length -4)
#echo $folder_zip"<---"

if ( Test-Path $folder_zip ) {
#if (-not (Test-Path $folder_zip)) {
#echo "adresar $folder_zip je"
}else{
# kontrola jesli existuje take rozpakovany adresar k souboru *.zip
# kdyz uz adresar existuje tak nezarazovat soubor *.zip do volby k rozpakovani (RadioButtony)
#echo "adresar $folder_zip neni"
$all_zip_pouzitelne += $all_file_zip_2[$aa]
#echo $all_zip_pouzitelne
}
}

$d_all_zip_pouzitelne = $all_zip_pouzitelne.Length

if ( $d_all_zip_pouzitelne -eq 0 ) {
Write-host -ForegroundColor red "v ceste '$path' sice byli nalezene soubory *.zip ale ty byli jiz rozpakovany drive"
Write-host -ForegroundColor red "soubory nelze znovu rozpakovavat do stejneho adresare, ktery uz existuje"
Write-host -ForegroundColor yellow $pole_tipy[22]
echo "konec programu"
sleep 10
Exit 5
}

#for ( $bb = 0; $bb -le $d_all_folder_pouzitelne; $bb++ ){
#echo $all_folder_pouzitelne[$bb]
#}

echo "pocet archivu pripravenych pro dalsi zpracovani: $d_all_zip_pouzitelne"

#exit 1

####################################################################
# grafika CheckBoxu vyberu adresare odsud 
####################################################################

$vyska_okna_y_adresare = (($d_all_zip_pouzitelne +1)*20) # *20 ( nejlepsi vychazi 20 vyska na 1 button)
#echo $vyska_okna_y_adresare

if ( $vyska_okna_y_adresare -gt 700 ) {
# opatreni pokud by bylo okno vetsi nez 800 v ose y aby uz se dal nezvetsovalo a nelezlo vertikane mimo obrazovku
# cili jestelize je vetsi jak 800 tak uz nech 800
$vyska_okna_y_adresare = 400
}
#echo $vyska_okna_y_adresare

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$objForm_adresare = New-Object System.Windows.Forms.Form # zalozi okno 
$objForm_adresare.Size = New-Object System.Drawing.Size(800, $vyska_okna_y_adresare) # a ted teprve definuje size
$objForm_adresare.Text = " VYBER SOUBORU ZIP"
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

$sel_zip=""
$x_adresare=10
$y_adresare=5

# v cyklu vygeneruje pole RadioButtons podle poctu souboru klicu a adresari ./keys
$RadioButton_adresare=@()

for ($cc = 0; $cc -le $d_all_zip_pouzitelne -1; $cc++) {
$RadioButton_adresare +=""
$RadioButton_adresare[$cc] = New-Object System.Windows.Forms.RadioButton # $RadioButton_adresare[0] uz je predem definovany zatim jako prazdny
$RadioButton_adresare[$cc].Location = New-Object System.Drawing.Size($x_adresare, $y_adresare) # vykresli RadioButton$RadioButton_adresare[$aa].Location = New-Object System.Drawing.Size($x_adresare, $y) # vykresli RadioButton
$y_adresare=( $y_adresare + 20 )
$RadioButton_adresare[$cc].Size = New-Object System.Drawing.Size(700, 20) # 700, 20
# kdyz je v adresari keys puze jeden klic tak ho rovnou zafajfkuje predem, jinak ne
#echo $d_all_zip_pouzitelne
if ( $cc -eq 0 ) { $RadioButton_adresare[$cc].Checked = $true }else{ $RadioButton_adresare[$cc].Checked = $false } 
$RadioButton_adresare[$cc].text = $all_zip_pouzitelne[$cc]
$objForm_adresare.controls.Add($RadioButton_adresare[$cc])
}

# ----------------------------------------------

$OKButton_adresare              = New-Object System.Windows.Forms.Button
#$OKButton.Location     = New-Object System.Drawing.Size(125, 810 )
$OKButton_adresare.Location     = New-Object System.Drawing.Size(337, ($y_adresare+20) )
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

for ($dd = 0; $dd -le $d_all_zip_pouzitelne; $dd++) {
#echo $dd
#echo $RadioButton[$cc].AccessibilityObject.state
if ( $RadioButton_adresare[$dd].AccessibilityObject.state -like "Checked, Focusable" ){
#echo $klice[$cc]
#$sel_file=$key_file_name[$bb]
#$sel_file_key=$klice[$cc] # <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
$vybrany_zip = $all_zip_pouzitelne[$dd]
break
}
}

if ( $vybrany_zip.Length -eq 0 ){
Write-host -ForegroundColor red "nebyl vybran zadny soubor zip, konec programu"
sleep 3
Exit 1
}

echo "vybran archiv: $vybrany_zip"
sleep 3

########################   tady hledat v listu heslo a nazev souboru klice

#Remove-Variable unzip, cmd_output, d_cmd_output, radek_list, nalezeno -ErrorAction SilentlyContinue

# test exist unzip.exe
$cmd_unzip = ("unzip.exe")
if (-not (Test-Path "$path$cmd_unzip")){
Write-host -ForegroundColor red "chyba programu, nenalezen soubor $path$cmd_unzip"
echo "konec programu"
sleep 10
exit 1
}

#& $unzip "-l" "abcd.zip"

$cmd_output = @()
$d_cmd_output = $cmd_output.Length
#echo $d_cmd_output"<"

$cmd_output +=  & $cmd_unzip "-l" $path$vybrany_zip

$d_cmd_output = $cmd_output.Length
#echo $d_cmd_output"<<"
$hledej_radek_heslo = "Length     Date   Time    Name"
#list pozpatku
for ( $ee = $d_cmd_output; $ee -ge 0; $ee-- ) { # nechat -ge !
#echo "$ee $cmd_output[$ee]"
$out=""
#$out+=$ee
#$out+="---"
$out+=$cmd_output[$ee]
#echo $out

#hleda radek z heslem v listu zipu
$radek_list = [string] $cmd_output[$ee]

$nalezeno = $radek_list.IndexOf($hledej_radek_heslo)
#echo $nalezeno"<<<<"

if ( $nalezeno -ne -1 ){
# paklize nenajde tak je -1
$radek_nalezeno = $ee
break # break je dulezitej aby pri podvrhu se zastavil u prvniho vyskytu, break nechat !
}
}

$nalezene_heslo = $cmd_output[$radek_nalezeno + 3]
#echo $nalezene_heslo
$d_nalezene_heslo = $nalezene_heslo.Length
#echo "delka hesla = $d_nalezene_heslo"
#echo $nalezene_heslo.GetTypeCode()
# nalezeny nazev souboru klice v listu archivu zip
$nalezeny_nazev_klice_v_listu_vybraneho_archivu_zip = $cmd_output[$radek_nalezeno + 5]
#$nalezeny_datum_vytvoreni_archivu = $cmd_output[$radek_nalezeno + 7]
echo "pri zazipovani by pouzit klic z nazvem: $nalezeny_nazev_klice_v_listu_vybraneho_archivu_zip"
##############################################################################################
# tady nove pridano nacte sha klice z filecommentu a porovna ho ze sha klice v adrsari keys
##############################################################################################
# nove 2 udaje na radku 3
$nalezeny_sha_a_datum_vytvoreni_archivu = $cmd_output[$radek_nalezeno + 7]
# tady bude find a pod tim jak vypada celej radek nactenej z FileComment radek 3
# Sha1SumKeyFile: a6553b6c91c7c308352f3f85cf7e252b9bd49be4 DateZipFile: 20.06.2024 06:13
$sha_klice_nacteneho_z_file_commentu = $nalezeny_sha_a_datum_vytvoreni_archivu.Substring(16,40) #16,40
$nalezeny_datum_vytvoreni_archivu = $nalezeny_sha_a_datum_vytvoreni_archivu.Substring(70,16) # 70,16
#echo $nalezeny_sha_a_datum_vytvoreni_archivu"<"
#echo $sha_klice_nacteneho_z_file_commentu"<<"
#echo $nalezeny_datum_vytvoreni_archivu"<<<"
#xit 1

#echo "sha1sum klice pouziteho pri vytvoreni archivu: $sha_klice_nacteneho_z_file_commentu"

# vypise datum vytvoreni archivu
#echo "datum vytvoreni archivu $nalezeny_datum_vytvoreni_archivu"
#sleep 10

for ( $ff = 0 ; $ff -le $d_nalezene_heslo - 2; $ff= $ff+2 ){
#echo $ff
$dvojice_heslo = $nalezene_heslo.Substring($ff,2)
#echo $dvojice_heslo # string
$dvojice_heslo_int = [int] $dvojice_heslo
#echo $dvojice_heslo_int
}

#################################################################################################

# nacteni souboru klice precteneho z file commentu do matrixu
$nazev_adresare_klice = "./keys"

# kontrola existuje li folder keys
$nazev_adresare_klice_exist = Test-Path $nazev_adresare_klice
if ($nazev_adresare_klice_exist -clike "False"){
Write-host -ForegroundColor red "neni adresar $nazev_adresare_klice"
Write-host -ForegroundColor yellow $pole_tipy[9]
echo "konec programu"
sleep 5
exit
}

# kontrola jestli existuje v adresary keys klic nacteny z file commentu zipu
if (-not (Test-Path "$nazev_adresare_klice/$nalezeny_nazev_klice_v_listu_vybraneho_archivu_zip")){
Write-host -ForegroundColor red "nenalezen soubor $nazev_adresare_klice/$nalezeny_nazev_klice_v_listu_vybraneho_archivu_zip"
echo "konec programu"
sleep 10
exit 1
}
$klice = @(Get-ChildItem $nazev_adresare_klice -Name)
$d_klice = $klice.length - 1
#echo $d_klice

# zde kontrola delky nazvu klice ne delsi nez 73 znaku
$klice_2 = @()
for ($gg = 0; $gg -le $d_klice; $gg++ ) {
#echo $klice[$aa2]
$delka_nazvu_jednoho_klice = $klice[$gg].Length
#echo $delka_nazvu_jednoho_klice
# ne delsi nazev klice nez 73 znaku
if ($delka_nazvu_jednoho_klice -lt 74 ) {
#echo "pridat"
$klice_2 += $klice[$gg]
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

#exit 1

############################################################
# kontrola sha nacteno a sha klice v keys jestli je stejne
############################################################

#echo $nazev_adresare_klice"<"
#echo $nalezeny_nazev_klice_v_listu_vybraneho_archivu_zip"<<"
#echo $sha_klice_nacteneho_z_file_commentu"<<< nacteneho klice"
#
$nazev_kontrolovaneho_sha_klice = $nazev_adresare_klice
$nazev_kontrolovaneho_sha_klice += "/"
$nazev_kontrolovaneho_sha_klice += $nalezeny_nazev_klice_v_listu_vybraneho_archivu_zip
#echo $nazev_kontrolovaneho_sha_klice"_-_"

$kontrolovany_klic_sha = Get-FileHash -Path $nazev_kontrolovaneho_sha_klice -Algorithm SHA1
$sha_2 = $kontrolovany_klic_sha.Hash
$d_sha_2 = $sha_2.Length
$sha_4=""
for ($xx2 = 0; $xx2 -le $d_sha_2 -1; $xx2++ ) {
$znak_sha_2 = $sha_2.Substring($xx2,1)
$znak_sha_2_low = $znak_sha_2.ToLower() 
# funkce dela z velkejch pismen maly, jako ma linux
$sha_4 += $znak_sha_2_low
}
echo "sha1sum pouziteho klice : $sha_klice_nacteneho_z_file_commentu "
echo "sha1sum aktualniho klice: $sha_4"
#
if ( $sha_klice_nacteneho_z_file_commentu -like $sha_4 ) {
#echo "sha klicu je stejne"
}else{ 
# sha klicu je ruzne
Write-host -ForegroundColor red "kontrolni soucet obsahu klice pouziteho pri zazipovani neodpovida obsahu aktualniho klice"
Write-host -ForegroundColor red  $nazev_kontrolovaneho_sha_klice
echo "konec programu"
sleep 10
Exit 1
}

#echo $nalezeny_sha_a_datum_vytvoreni_archivu"<"
#echo $sha_klice_nacteneho_z_file_commentu"<<"
#echo $nalezeny_datum_vytvoreni_archivu"<<<"
#xit 1
#echo $nalezeny_nazev_klice_v_listu_vybraneho_archivu_zip"<<<<"

sleep 10

#################################################################
# NACTENI NAZVU SOUBORU KLICE A REFERENCE NA HESLO ODSUD
#################################################################

# nacteni zvoleneho klice do matrixu
Remove-Variable matrix -ErrorAction SilentlyContinue
$matrix=[System.Collections.ArrayList]::new()

# prazdny matrix 62 vodorovne a 126 svisle
for ( $hh = 0; $hh -le 125; $hh++ ) {
#delka 62
$matrix.Add(@("","","","","","","","","","","","","","","","","","","","","","","","","","","","","",
"","","","","","","","","","",
"","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","")) > $null
# bez > $null vypise 0-125 radek
}

$poc=1

#$stream_reader_1 = [System.IO.StreamReader]::new($nazev_klice)
$nacti_cestu_a_klic = $nazev_adresare_klice
$nacti_cestu_a_klic += "/"
$nacti_cestu_a_klic += $nalezeny_nazev_klice_v_listu_vybraneho_archivu_zip
echo $nacti_cestu_a_klic

$stream_reader_1 = [System.IO.StreamReader]::new($nacti_cestu_a_klic)

#while (-not $stream_reader.EndOfStream) {
for ( $ii = 0; $ii -le 125; $ii++){
for ( $jj = 10; $jj -le 71; $jj++){
$line_read = ($stream_reader_1.ReadLine()) 
$in = ""
$in = '$matrix'
$in += "["
$in += $ii
$in += "]["
$in += $jj
$in += ']="'
$in += $matrix[$ii][$jj]
$in += $line_read
$in +='"'
echo $in
$matrix[$ii][$jj]=$line_read
$poc++
}
}

$stream_reader_1.close()

# vytvoreni dvojic pro slozeni helsa zipu
$heslo_pro_rozpakovani=""
$poc_heslo = 0
for ( $kk = 0 ; $kk -le $d_nalezene_heslo - 2; $kk = $kk + 2 ){
#echo $kk
$dvojice_heslo = $nalezene_heslo.Substring($kk,2)
#echo $dvojice_heslo # string
$dvojice_heslo_int = [int] $dvojice_heslo
#echo $dvojice_heslo_int
$heslo_pro_rozpakovani += $matrix[$poc_heslo][$dvojice_heslo_int]
$poc_heslo++
}

Write-host -ForegroundColor red $nalezene_heslo
Write-host -ForegroundColor cyan $heslo_pro_rozpakovani
sleep 5
# zde samotny rozpakovani archivu


<#
& $cmd_unzip "-t" "-P" $heslo_pro_rozpakovani $vybrany_zip
sleep 3
& $cmd_unzip "-x" "-P" $heslo_pro_rozpakovani $vybrany_zip
# ^^^^ predelat na batku, aby to bylo jednotny
#>

$o2=@()
$uv='"'
$o2+="@echo off"
$o2+="verify on"
# tady udelat test && unzip, jde to
# unzip -P heslo -t neco.zip && unzip.exe -x -P heslo neco.zip
$o2+="unzip.exe -t -P "+$heslo_pro_rozpakovani+" "+$uv+$vybrany_zip+$uv+" && "+"unzip.exe -x -o -P "+$heslo_pro_rozpakovani+" "+$uv+$vybrany_zip+$uv
# parametr "-o" prepis soubory vzdycky a bez ptani, pokud uz existuje
# -o  overwrite files WITHOUT prompting # unzip help - "unzip.exe -x -o -P  ------------------^
# -n  never overwrite existing files # unzip help --------------------------------------------^
# parametr -n nikdy neprepisuj jiz existujici soubor(y); -o vzdy prepisuja bez ptani
# takze po dlouhejch uvahach mnakonec zvolen "-o" prepis vzdycky,m kdyz bude archiv nazev.zip ten se rozbali do adr. nazev/
# pak se prejmenuje nazev.zip na nazev2.zip ( takze ho zacne videt ) a ten se rozbali tzn. znovu do adr. nazev/
# protoze ho ma vsobe tak se v nazev/ prepise vsechno znova a kdyby neco uz chybelo tak se to znova doplni
# asi nejlepsi logicka volba, kdyby se dalo "-n" tak by rozpakoval znova jenom to co by bylo smazany
# attrib /S /D +r adresar/*.*  - ReadOnly rekurzivne uplne vsechno soubory i adresar /S je rekurzivne  a /D je directory
# attrib +r -h /S /D nazev & unzip -x -o nazev.zip - prepise vsechno i pres ReadOnly, a souborum da znova parametr -r ktery sou v nazev.zip

# pridany uvozovky, kdyz jsou v nazvu mezery
$o2+="sleep 5"
#$o2+="unzip.exe -x -P "+$heslo_pro_rozpakovani+" "+$uv+$vybrany_zip+$uv
#echo $o2

#$file_bat_2="unzip.bat"
# nove RandomNazev.bat
# podle linux stamp dela nahodnej nazev souboru
# nakonec prida jeste jeden znak, protoze stamp se meni po vterine, coz je dlouho
[string] $stamp_2 = [DateTimeOffset]::Now.ToUnixTimeseconds()
$d_stamp_2 = $stamp_2.Length
$file_bat_2=""
for ($aa6 = 10; $aa6 -ge 1; $aa6-- ){ # bylo 4, je 10
$cast_stamp_int_2 = 97
$cast_stamp_2=$stamp_2.Substring( ($d_stamp_2 -$aa6), 1)
$cast_stamp_int_2 += [int32] $cast_stamp_2
$file_bat_2 += [char] $cast_stamp_int_2
}
$rnd_znak_2 = Get-Random -Minimum 97 -Maximum 122 # a=97, z=122
$file_bat_2+= [char] $rnd_znak_2
$file_bat_2 += ".bat"
#echo $file_bat_2
#
Set-Content -Path "$path$file_bat_2" -Encoding ASCII -Value $o2
sleep 1 # pocka po write
#& "$o2"
#$run_o2=("./unzip.bat")
$run_o2=("./$file_bat_2") # musi bejt takhle !
#echo $run_o2
& $run_o2

sleep 1

# odstaneni vsech souboru ktere byli vytvoreny, aby nezustavl nikde bordel
Remove-Item -Path "$path$file_bat_2" -Force -ErrorAction SilentlyContinue
sleep 1

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

sleep 10

