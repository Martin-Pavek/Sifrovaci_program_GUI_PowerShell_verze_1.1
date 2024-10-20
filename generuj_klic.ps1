cls

Remove-Variable delka_args,nazev_adresare_klice,nazev_adresare_klice_exist,nazev_klice, matrix, d_nazev_klice, nazev_adresare_klice -ErrorAction SilentlyContinue

$nazev_adresare_klice = "./keys"
# kontrola existuje li folder keys
$nazev_adresare_klice_exist = Test-Path $nazev_adresare_klice
if ($nazev_adresare_klice_exist -clike "False"){
Write-host -ForegroundColor yellow "byl vytvoren adresar $nazev_adresare_klice"
#Write-host -ForegroundColor yellow $pole_tipy[9]
$null = New-Item -Path $nazev_adresare_klice -ItemType Directory -Force
echo "spust program znovu"
sleep 5
exit
}

#exit 1

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

<# stary
# delka 62 pole pro generovani hesla
$table = @("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",
"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z",
"1","2","3","4","5","6","7","8","9","0")
#>

# ^^^^^___ zde presna nahrada za toto stary
# odsud novi 20.10.2024
# A=65, Z=90, a=97, z=122, 0=48, 1=49, 9=57
#$pole=@(48,57,65,90,97,122) # 0-9, A-Z, a-z 
$pole=@(97,122,65,90,49,57)
$d_pole=$pole.Length
$table=@()
for ( $aa = 0; $aa -le $d_pole -2; $aa++ ) {
$od = $pole[$aa]
$do = $pole[$aa+1]
for ( $bb = $od; $bb -le $do; $bb++ ) {
$z = [char] $bb
$table+=$z
}
$aa++
}
$table+="0"
# az sem novy 20.10.2024
#echo $table
#sleep 20

$delka_table = $table.Length #62 znaku

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

