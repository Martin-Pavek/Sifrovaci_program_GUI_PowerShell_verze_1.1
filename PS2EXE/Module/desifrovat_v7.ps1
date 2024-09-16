cls
<#---------------------------------------------------#>
# Name             : Windows PowerShell
# Version          : 5.1.19041.1682

# Edice	Windows 10 Pro
# Verze	21H2
# 27.5.2023 pridano vytvoresi set/unset a zvuky
<#---------------------------------------------------#>

#$config_file_name = "config.cfg"
$config_file_name = "config_v7.cfg"
# config.cfg umisten v korenoven ardesari na cd-rw D:\ na flesce F:\ atd. ( vsechno mimo C:\ )

# v zahlavi spusteneho okna zobrazi informoce ( neco jako echo $0 v bash )
[string] $scriptName = pwd
#$scriptName += "\"
$scriptName += $MyInvocation.MyCommand.Name
$host.UI.RawUI.WindowTitle = $scriptName

# testuje kery pismeno je cd-mechanika a hleda soubor (bejva D:\ ale uz sem vydel ze mel nekdo i disk "O:\" apod.)
$nalezen_cfg = 0
for ($znak = 68; $znak -le 90; $znak++){ # jede od D - Z az 112
$file_config = [char] $znak
$jednotka_2 = $file_config
$jednotka_2 += ":"
$file_config += ":\"
$jednotka = $file_config
#echo $jednotka
$file_config += $config_file_name
if (-not (Test-Path $file_config)){
#echo "nenalezeno"
}else{
#echo "nalezeno"
$nalezen_cfg = 1
break
}
}


#echo $jednotka
#echo $nalezen_cfg"< zde nalezen *.cfg"
#echo "nalezen konfiguracni soubor $file_config"

if ($nalezen_cfg -like "1"){
echo "nalezen konfiguracni soubor $file_config"
}

if ($nalezen_cfg -like "0"){
Write-Warning "spatny nazev souboru $config_file_name"
echo "Konec programu"
sleep 10
Exit
}


# cfg nalezen a jeho nacteni
$cfg = @()
$list_cfg = (Get-content -Path $file_config)
foreach($line_cfg in $list_cfg){
#echo $line_cfg
$cfg+=$line_cfg
}

# radek 1 config.cfg
$path_email = $cfg[0]

# stejna jednotka pro soubory rar jako zde ( misto C:\ ) # config.cfg radek 1 "#:\work" apod.
$stejna_jednotka_path_email = $path_email.Substring(0,1)
#echo $stejna_jednotka_path_email

if ($stejna_jednotka_path_email -clike "#"){
$path_email = $jednotka
$path_email += $cfg[0].Substring(0,0)
$path_email += $cfg[0].Substring(3, $cfg[0].Length -3)
#Write-Warning "zmena slozka souboru rar bude na tomto disku v $path_email/"
}

$path_email += "/"
#echo $path_email"<<<"
#exit

echo "pracovni adresar ze soubory *.rar nalezeni v $file_config je $path_email"

# $cfg[1] WinRar portable verze
$rar_1 = $cfg[1] # radek 2 config.cfg
$portable_rar_1 = $rar_1.Substring(0,1)
if ($portable_rar_1 -clike "#"){
$rar_1 = $jednotka
$rar_1 += $cfg[1].Substring(3, $cfg[1].Length -3)
# Write-Warning "portable verze WinRar config.cfg radek 2"
}
#echo $rar_1

# $cfg[2] WinRar portable verze
$rar_2 = $cfg[2] # radek 3 config.cfg
$portable_rar_2 = $rar_2.Substring(0,1)
if ($portable_rar_2 -clike "#"){
$rar_2 = $jednotka
$rar_2 += $cfg[2].Substring(3, $cfg[2].Length -3)
# Write-Warning "portable verze WinRar config.cfg radek 3"
}
#echo $rar_2

# $cfg[3] WinRar portable verze
$rar_3 = $cfg[3] # radek 4 config.cfg
$portable_rar_3 = $rar_3.Substring(0,1)
if ($portable_rar_3 -clike "#"){
$rar_3 = $jednotka
$rar_3 += $cfg[3].Substring(3, $cfg[3].Length -3)
# Write-Warning "portable verze WinRar config.cfg radek 4"
}
#echo $rar_3

# $cfg[4] WinRar portable verze
$rar_4 = $cfg[4] # radek 5 config.cfg
$portable_rar_4 = $rar_4.Substring(0,1)
if ($portable_rar_4 -clike "#"){
$rar_4 = $jednotka
$rar_4 += $cfg[4].Substring(3, $cfg[4].Length -3)
# Write-Warning "portable verze WinRar config.cfg radek 5"
}
#echo $rar_4

# radek 6 config.cfg
$adresar_hesla = $cfg[5]
#echo $adresar_hesla # < novy (adresar kde budou soubory hesel aby to nestrasilo v rootu)


# test instalace rar (4 moznosti)
if (Test-Path $rar_1){
$rar = $rar_1
}
elseif (Test-Path $rar_2){
$rar = $rar_2
}
elseif (Test-Path $rar_3){
$rar = $rar_3
}
elseif (Test-Path $rar_4){
$rar = $rar_4
}else{
Write-Warning "nainstalovat program WinRar"
sleep 5
Exit
}

echo "umisteni souboru WinRar nalezene v $file_config je $rar"

# radek 7 config ( "sound" a nebo "nosound" )
$play_sounds = $cfg[6]

if ( $play_sounds -like "sound" ){
echo "zvuky jsou zapnuty"
} elseif ( $play_sounds -like "nosound" ){
echo "zvuky jsou vypnuty"
} else {
Write-host -ForegroundColor yellow "chyba radek 7 souboru $file_config obsahovat 'sound' nebo 'nosound'"
Write-Host "konec programu"
sleep 5
Exit
}

#echo $play_sounds
#echo $ozvuceno

function HandPlay {
if ( $play_sounds -like "sound" ){
[System.Media.SystemSounds]::Hand.Play()
}
}

function AsteriskPlay {
if ( $play_sounds -like "sound"){
[System.Media.SystemSounds]::Asterisk.Play()
}
}

# pokud vubec neexistuje slozka ze soubory (ne jenom soubory samotne)
$dir_email_exist = Test-Path $path_email

if ($dir_email_exist -clike "False"){
HandPlay
echo "neni soubor  $path_email"
New-Item -Path $path_email -ItemType Directory -force
Write-host -ForegroundColor yellow "byla vytvorena nova slozka  $path_email\"

# vytvoti v adresari archivy soubotu set a unset attrib bat
$SetAtrrib=@("@echo off","attrib.exe -r *.bat","attrib.exe +r *.ps1","attrib.exe +r *.zip","attrib.exe +r *.txt","attrib.exe +r *.rar","dir","attrib" ,"pause","@echo on")
Set-Content -Path "$path_email\SetReadOnlyAll.bat" -Value $SetAtrrib
sleep 1
$UnSetAttrib=@("@echo off","attrib.exe -r *.bat","attrib.exe -r *.ps1","attrib.exe -r *.zip","attrib.exe -r *.txt","attrib.exe -r *.rar","dir","attrib" ,"pause","@echo on")
Set-Content -Path "$path_email\UnsetReadOnlyAll.bat" -Value $UnSetAttrib

Write-host -ForegroundColor yellow "zacni tim ze spustis program $jednotka_2\zasifrovat_v6.exe nebo $jednotka_2\zasifrovat_v7.exe"
Write-Host "konec programu"
sleep 5
exit
}

# hleda soubory *.rar
$all_rar = @(Get-ChildItem $path_email -Include '*.rar' -Name)

$delka_all_rar = $all_rar.length - 1

if ($delka_all_rar -clike -1) {
HandPlay
echo "zadne soubory *.rar v adresari $path_email"
echo "konec programu"
sleep 5
Exit
}

#echo $delka_all_rar
echo "ktery archiv rar rozpakovat ?"
echo "zadej cislo 0 az $delka_all_rar a zmackni <Enter>"
echo ""
for ($aa = 0; $aa -le ($delka_all_rar); $aa ++) {
$klic = [ string] $aa
$klic += ") "
$klic += $cesta
$klic +=  $all_rar[$aa]
echo $klic
}

# read
$ErrorActionPreference = 'SilentlyContinue'
Remove-Variable volba
[int] $volba = Read-Host -Prompt '?'
$vybrany_rar = $all_rar[$volba]

# osetreni vstupu chyba zadani uzivatele
if ( $volba -gt  $delka_all_rar ){
HandPlay
echo "chyba zadani" # vetsi
Remove-Variable -Name vybrany_rar
sleep 3
Exit
} elseif ( $volba -lt 0 ) {
HandPlay
Remove-Variable -Name vybrany_rar
echo "chyba zadani" # mensi
sleep 3
Exit
}
echo "byl vybran soubor $path_email$vybrany_rar"
Remove-Variable volba
$ErrorActionPreference = 'Continue'

<# klavesa enter pri Read-Host = vysledek vzdycky nula ?! (misto nil treba) to je vzlastni
[int] $xxxzzz = Read-Host;echo $xxxzzz
# takze paklize chce clovek nulu tak staci odentrovat jenom :), zajimavej zpusob
#>

# precteni souboru komentare z vybraneho archivu rar a ulezeni datumu k heslu do promenne
$cmd_rar_list_output = & $rar "l" "$path_email$vybrany_rar"
# je kupodivu stejne rychlej list souboru kterej ma traba giga a souboru o delce nakolika Kb (testovano rar 1.4 Gb)
#echo $cmd_rar_list_output.GetType()
#echo $cmd_rar_list_output.GetLength
#echo $cmd_rar_list_output[4] # vzdycky tento radek u registorvane verze rar a i u neregistrovany !
$hledej_datum_komentar = $cmd_rar_list_output[4]
echo "$hledej_datum_komentar < datum hesla nactene z komentare vybraneho souboru rar"
#echo " 012345678901234567890"
Remove-Variable -Name cmd_rar_list_output
$d_hledej_datum_komentar = $hledej_datum_komentar.Length
#echo $d_hledej_datum_komentar

if ( $d_hledej_datum_komentar -ne 16 ){ # ma 16 znaku datum v komentari
Write-Warning "nebyl nalezen komentar v souboru $path_email$vybrany_rar, konec programu"
sleep 10
Exit
}

# subst rok vybrany soubor rar
$rok_nazev_rar = $hledej_datum_komentar.Substring(6,4) # zde nutna zmena
#echo "$rok_nazev_rar"
#sleep 5

$file_kody = $jednotka + $adresar_hesla + "\" + "email_kody_" + $rok_nazev_rar + ".txt"

# test jestli existuje prislusni soubor hesel
if (-not (Test-Path $file_kody)){
Write-Warning "nenalezen soubor hesel $file_kody"
$hlaseni_generovat_soubor_hesel = $jednotka + "generovat_hesla\" + "generovat_hesla_" + $rok_nazev_rar + ".bat"
Write-Warning "spustit soubor $hlaseni_generovat_soubor_hesel"
Write-Warning "konec programu"
sleep 5
Exit
}

echo "otevren soubor hesel $file_kody"
echo "$hledej_datum_komentar < datum hledany v souboru hesel"
sleep 3

# otevreni souboru hesel a hledani hesla
$reader = new-object System.IO.StreamReader($file_kody) # rychli nenarocny na ram
$count = 1
$lineNumber = 1
$pom_nalezeno = 0
while(($line = $reader.ReadLine()) -ne $null){
++$lineNumber 
if ($line.ToLower().Indexof($hledej_datum_komentar) -ge 0){
++$count
#Write-Host "$count $lineNumber $line <<"
$pom_nalezeno = 1
$nalezen_radek = $line
[string] $heslo = $lineNumber
$nalezen_radek_line = $count
[string] $heslo = $lineNumber
++$count
$heslo = $reader.ReadLine()
[int32] $radek_nalezeno_datum = $lineNumber
}
}
$reader.Close()
if ($pom_nalezeno -clike "0"){
HandPlay
echo "toto datum v souboru hesel nenalezeno"
sleep 5
Exit
}

$out_radek = [int32] $radek_nalezeno_datum - 1
AsteriskPlay
echo "$nalezen_radek < nalezeno datum v suboru hesel"
echo "nalezeno datum v souboru hesel radek $out_radek"
#echo $heslo
sleep 5

# test a rozpakovani
& $rar "t" "-p$heslo" "$path_email$vybrany_rar" # test archivu
sleep 5

& $rar "x" "-p$heslo" "-y" "$path_email$vybrany_rar" "$path_email/"
Write-host -ForegroundColor cyan $heslo
AsteriskPlay
echo "Hotovo"
sleep 5

