cls

Remove-Variable delka_args,nazev_adresare_klice,nazev_adresare_klice_exist,nazev_klice, matrix, d_nazev_klice -ErrorAction SilentlyContinue

$delka_args = $args.length
#echo "celkem args $delka_args"
if ($delka_args -clike 0) {
Write-host -ForegroundColor red "zadej nazev klice jako args[0]"
Write-host -ForegroundColor red "konec programu"
sleep 5
Exit 1
}

$nazev_adresare_klice = "./keys" # adresar se soubory klicu

$nazev_adresare_klice_exist = Test-Path $nazev_adresare_klice
if ($nazev_adresare_klice_exist -clike "False"){
Write-host -ForegroundColor red "neni adresar $nazev_adresare_klice"
Write-host -ForegroundColor red "konec programu"
sleep 5
Exit 1
}

[string] $args_0 = $args[0]
#echo $args_0
#exit 1
$nazev_klice = $nazev_adresare_klice
$nazev_klice += "/"
$nazev_klice += $args_0
echo $nazev_klice
#echo $nazev_klice.GetTypeCode()
# ne delsi nazev klice nez 73 znaku
$d_args_0 = $args_0.Length
#echo $d_args_0.GetType()
#echo $d_args_0
if ( $d_args_0 -gt 73 ) {
Write-host -ForegroundColor red "delka nazvu klice presahuje 73 znaku, zkrate nazev klice a puste program znovu"
Write-host -ForegroundColor red "delka tohoto klice byla $d_args_0 znaku"
echo "konec programu"
sleep 10
Exit 1
}


if (-not (Test-Path $nazev_klice)) {
# soubor klice tohoto nazvu jeste nexistuje
}else{
Write-host -ForegroundColor red "soubor klice s timto nazvem jez existuje, zvolte jiny nazev a puste program znovu"
echo "konec programu"
sleep 5
Exit 1
}

$matrix=[System.Collections.ArrayList]::new()

# prazdny matrix 62 vodorovne a 126 svisle
for ( $aa = 0; $aa -le 125; $aa++ ) {
#delka 62
$matrix.Add(@("","","","","","","","","","","","","","","","","","","","","","","","","","","","","",
"","","","","","","","","","",
"","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","")) > $null
# bez > $null vypise 0-125 radek
}

#$matrix[0].Length # 62 vodorovne

# delka 62 pole pro generovani hesla
$table = @("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",
"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z",
"1","2","3","4","5","6","7","8","9","0")
$delka_table = $table.Length

# 7812 klicu musi byt celkem
$poc = 1
$stream_writer_1 = [System.IO.StreamWriter]::new($nazev_klice)

for ( $aa = 0; $aa -le 125; $aa++){
for ( $bb = 10; $bb -le 71; $bb++){

$rnd = Get-Random -Minimum 0 -Maximum $delka_table # vebere nahodne jeden klic z pole $table
$matrix[$aa][$bb]=$table[$rnd]
$out = ""

$out = '$matrix'
$out += "["
$out += $aa
$out += "]["
$out += $bb
$out += ']="'
$out += $matrix[$aa][$bb]
$out +='"'
echo $out
#$stream_writer_1.WriteLine("$out")
$out_2=$table[$rnd]
#echo $out_2
$stream_writer_1.WriteLine("$out_2")
$poc++
}
}

$stream_writer_1.close()

<#
$poc--
echo $poc

$matrix[125][71]
#$matrix[0][9]
$matrix[0][10]
#$matrix[0][7]
$matrix[0][11]
$matrix[125][10]
#>


#sleep 5

