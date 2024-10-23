cls
Remove-Variable matrix,volba_klice,nazev_klice -ErrorAction SilentlyContinue

# tady editovat sestu do slaozky "keys" podle svoji situace
$cesta_do_adresare_keys="C:\Users\DELL\Documents\ps1\_GUI\Sifrovaci_program_GUI_PowerShell_verze_1.1\keys\"
#

echo "zadej nazev klice z adresare"
echo "$cesta_do_adresare_keys"
echo "napr. autoruv-klic-cislo-1"
echo "?"
[string] $volba_klice = Read-Host
echo $volba_klice
$nazev_klice = $cesta_do_adresare_keys + $volba_klice
echo $nazev_klice

# test jestli existuje zvoleny soubor
$file_exist_test = Test-Path $nazev_klice
if ($file_exist_test -clike "False"){
Write-host -ForegroundColor red "nenalezen soubor $nazev_klice"
echo "konec programu"
sleep 5
exit
}

$matrix=[System.Collections.ArrayList]::new()

# 23.10.2024 nove definice prazdneho matrixu ( pomoci cyklu )
# prazdny matrix 62 vodorovne a 126 svisle
for ( $aa = 0; $aa -le 125; $aa++ ) { # 0-125 radek pod sebou
#delka 72
$vv=@()
for ( $bb = 0; $bb -le 72; $bb++ ) { # 0-72 je radek
$vv+=""
}
$matrix.Add($vv) > $null
# bez > $null vypise 0-125 radek
}
# 23.10.2024 zde konec, nove definice prazdneho matrixu

$stream_reader_1 = [System.IO.StreamReader]::new($nazev_klice)

# zde nacita klic to matice
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
#echo $in
$matrix[$dd][$ee]=$line_read
}
}
$stream_reader_1.close()
sleep 3
# matrix do souboru
cls
$pole_out=@()
echo "keys view $volba_klice"
$pole_out+="keys view - $volba_klice"
echo ""
$pole_out+=""

$h1="     11111111112222222222333333333344444444445555555555666666666677"
$h2="     01234567890123456789012345678901234567890123456789012345678901"
$h3="     ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
echo $h1
echo $h2
echo $h3

$pole_out+=$h1
$pole_out+=$h2
$pole_out+=$h3

$poc_1=1
$jeden_radek="000--"
for ( $ff = 0; $ff -le 125; $ff++){ # 126 znaku hesla, radky 0-125
for ( $gg = 10; $gg -le 71; $gg++){ # delka kazdeho radku je 62 znaku ( 10-71 )
$jeden_radek+=$matrix[$ff][$gg]
}
echo $jeden_radek
$pole_out+=$jeden_radek

if ( $poc_1 -lt 10 ) { 
$jeden_radek="00"
$jeden_radek+=[string]$poc_1
$jeden_radek+="--"
}
elseif ( $poc_1 -gt 9 -and $poc_1 -lt 100 ) {
$jeden_radek="0"
$jeden_radek+=[string]$poc_1
$jeden_radek+="--"
}
elseif ( $poc_1 -gt 99 ) {
$jeden_radek=""
$jeden_radek+=[string]$poc_1
$jeden_radek+="--"
}

$poc_1++
}

echo $h3
echo $h1
echo $h2
$pole_out+=$h3
$pole_out+=$h1
$pole_out+=$h2

echo ""
# ulozeni vystupu do souboru
echo "toto ulozeno do souboru:"
$out_file_name="keys_view-"+$volba_klice+".txt"
echo $out_file_name

Set-Content -Path $out_file_name -Encoding ASCII -Value $pole_out

# ceka v pauze na ukonceni
Read-Host -Prompt "Press ENTER to continue"
sleep 1
