﻿cls
# start of script ( store list existing variable names )
$ExistingVariables = Get-Variable | Select-Object -ExpandProperty Name

[string] $path = $pwd

if ( $path.Length -gt 3 ){
$path += "\"
}
#echo $path
#echo $path.Length
$zapsano_txt = 0


# vytvori v adresari odkud byl zpusten novy adresar "sha" pokud jeste neexistuje
$adresar_sha = "sha1sum"
$test_exist_adresar_sha = Test-Path $adresar_sha
if ($test_exist_adresar_sha -clike "False"){ 
#echo "nenalezen adtresar $adresar_sha"
New-Item -Path $adresar_sha -ItemType Directory -Force
}


$all_file_zip = @( Get-ChildItem $path -Include '*.zip' -Name ) # bere jenom soubory zip
# este je -Exclude taky ( ber vsechno krome -Exclude '*.txt' napr.
# $all_file_zip = @( Get-ChildItem $path -Name -File ) # bere vsechny pripony souboru (-File rika neber adresare )
# Get-ChildItem -Name -File # jenom nazvy soubory, ne adresare
# Get-ChildItem -Name -Directory # naopak bez jenom adresare a neber soubory
# nevim jak je -Incude nebo -Exclude z dvouma polozkama napr. -Include '*.zip' and '*.rar' ??
$d_all_file_zip = $all_file_zip.Length -1
if ( $d_all_file_zip -eq -1 ) {
echo "zadne soubory zip ke zpracovani"
echo "konec"
sleep 5
exit 1
}

$d_all_file_zip = $all_file_zip.Length -1 #int32
#echo $d_all_file_zip"<"

for ( $aa = 0; $aa -le $d_all_file_zip; $aa++ ) {
$sha3=""
$jeden_soubor_zip = $all_file_zip[$aa]
echo $jeden_soubor_zip
$d_jeden_soubor_zip = $jeden_soubor_zip.length
$nazev_soubor_sum_txt = $jeden_soubor_zip.Substring(0,$d_jeden_soubor_zip -4 )
$nazev_soubor_sum_txt += "_sha1sum.txt"
#echo $nazev_soubor_sum_txt"<<"

# otestuje jestli soubor exituje a kdez ne tak zapise, jinak dela vic radku v jednom souboru
if (-not (Test-Path "$path/$adresar_sha/$nazev_soubor_sum_txt" ) ) {
#echo "tento soubor neexistuje"
$zapsano_txt++
# neexistuje tak zapise *.txt
# sha1sum odsud
$pokus2_sha = Get-FileHash -Path "$path$jeden_soubor_zip" -Algorithm SHA1
$sha = $pokus2_sha.Hash
$d_sha = $sha.Length
for ($aa1 = 0; $aa1 -le $d_sha -1; $aa1++ ) {
$znak_sha = $sha.Substring($aa1,1)
$znak_sha_low = $znak_sha.ToLower()
$sha3 += $znak_sha_low
}
#echo $sha3"<<<"
Set-Content -Path "$path/$adresar_sha/$nazev_soubor_sum_txt" -Encoding ASCII -Value $sha3
sleep 2
& type "$path/$adresar_sha/$nazev_soubor_sum_txt"
echo ""
}
}

#echo "hotovo"
echo "bylo zapsano $zapsano_txt novych souboru z kontrolnim souctem"

# End of script ( remove new variables )
$NewVariables = Get-Variable | Select-Object -ExpandProperty Name | Where-Object {$ExistingVariables -notcontains $_ -and $_ -ne "ExistingVariables"}
if ( $NewVariables ) {
#Write-Host "vymazu vsechny tyto preomenne: `n`n$NewVariables" # to "n$" tady dela newline
#Write-Host "vymazu vsechny tyto promenne: `n`n$NewVariables" # 'n'n$ - nalepeny na sobe neda newline | `n` n$ ( nedela newline )
Remove-Variable $NewVariables
} else {
#Write-Host "No new variable to remove !"
}

sleep 5
