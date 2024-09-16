cls
<#---------------------------------------------------#>
# Name             : Windows PowerShell
# Version          : 5.1.19041.1682

# Edice	Windows 10 Pro
# Verze	21H2
<#---------------------------------------------------#>

#$config_file_name = "config.cfg"
$config_file_name = "config_v6.cfg"
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

# setaveni datumu
[string] $letosni_rok = (Get-Date).Year
#$letosni_rok = "2024" #  <<< test podstcit jinej rok aby otevrel jinej soubor hesel jinak krome roku vse puvodni (tzn.datum ted)
#echo $letosni_rok.GetType()
$hledej_datum = "{0:dd_MM_$letosni_rok-HH_mm}" -f (Get-Date)
#$hledej_datum += "XXX" # <<< testovaci aby nenasel datum
#echo $datum
#echo $datum.GetType()

$file_kody = $jednotka + $adresar_hesla + "\" + "email_kody_" + $letosni_rok + ".txt"

# test jestli existuje prislusni soubor hesel
if (-not (Test-Path $file_kody)){
HandPlay
Write-Warning "nenalezen soubor hesel $file_kody"
$hlaseni_generovat_soubor_hesel = $jednotka + "generovat_hesla\" + "generovat_hesla_" + $letosni_rok + ".bat"
Write-Warning "spustit soubor $hlaseni_generovat_soubor_hesel"
Write-Warning "konec programu"
sleep 5
Exit
}
echo "otevren soubor hesel $file_kody"
echo "$hledej_datum < datum hledany v souboru hesel"
sleep 3

# otevreni souboru hesel a hledani hesla
$reader = new-object System.IO.StreamReader($file_kody) # rychli nenarocny na ram
$count = 1
$lineNumber = 1
$pom_nalezeno = 0
while(($line = $reader.ReadLine()) -ne $null){
++$lineNumber 
if ($line.ToLower().Indexof($hledej_datum) -ge 0){
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
sleep 7
Exit
}

$out_radek = [int32] $radek_nalezeno_datum - 1
AsteriskPlay
echo "$nalezen_radek < nalezeno datum v suboru hesel"
echo "nalezeno datum v souboru hesel radek $out_radek"
#echo $heslo
#echo $path_email

# vytvoreni adresaze z datumem v ceste $cfg[0]
New-Item -Path $path_email$hledej_datum -ItemType Directory -force
Write-host -ForegroundColor yellow "byla vytvorena nova slozka $path_email$hledej_datum\"
Write-host -ForegroundColor yellow "nakopiruj do ni veskery obsah prilohy pro email"

[string] $pokracovat = Read-Host -Prompt 'napis "pokracovat" a stiskni Enter cokolik jineho ukonci program'
if ($pokracovat -ne "pokracovat") {
Remove-Item -recurse -Force -Path "$path_email$hledej_datum\"
Write-host -ForegroundColor yellow "slozka $path_email$hledej_datum\ byla smazana"
Write-Host "konec programu"
sleep 10
Exit
}
sleep 5

# zapakovani a test
& $rar "a" "-r" "-m5" "-hp$heslo" "-p$heslo" "$path_email$hledej_datum.rar" "$path_email$hledej_datum\" # zapakovani
sleep 2
& $rar "t" "-p$heslo" "$path_email$hledej_datum.rar" # test archivu
sleep 2

# zmena file time stamp u vytvoreneho souboru *.rar (aby byl stejnej jako datum v nazvu slozky, je tam casova prodleva pri pakovani)
$datum_zmen_file_stamp = $hledej_datum.Substring(0,2) + "-" + $hledej_datum.Substring(3,2) + "-" + $hledej_datum.Substring(6,4) + " " + $hledej_datum.Substring(11,2) + ":" + $hledej_datum.Substring(14,2)
#echo "$datum_zmen_file_stamp<"
#echo "$zmena_rar_file_stamp<<"
#sleep 20 # slouzi pro kontrolu jak se zmanil cas vytvoreni u souboru *.rar
$file_zmen_timestamp = Get-Item "$path_email$hledej_datum.rar" # musi zde bejt jinak to nefunguje
$file_zmen_timestamp.LastWriteTime = (Get-Date($datum_zmen_file_stamp))
Get-item "$path_email$hledej_datum.rar" # vypise cas u souboru

# prida souboru *.rar attribut jen pro cteni
$attrib = "C:\Windows\System32\attrib.exe"
$attrib_2 = "$jednotka" + "WinRAR-5.71_portable_version\attrib.exe"

if (Test-Path $attrib){
& $attrib +r "$path_email$hledej_datum.rar"
}elseif(Test-Path $attrib_2){
& $attrib_2 +r "$path_email$hledej_datum.rar"
}else{
Write-Warning "nikde nenalezen soubor attrib.exe"
}

# tisk hesla
AsteriskPlay
Write-host -ForegroundColor cyan $heslo
echo "Hotovo"
sleep 5

