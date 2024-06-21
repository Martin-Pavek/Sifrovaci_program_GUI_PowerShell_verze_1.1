cls

# podle linux stamp dela nahodnej nazev souboru
# nakonec prida jeste jeden znak, protoze stam se meni po vterine, coz je dlouho

[string] $stamp = [DateTimeOffset]::Now.ToUnixTimeseconds()
#echo $stamp
$d_stamp = $stamp.Length
$nazev_bat=""

for ($aa = 10; $aa -ge 1; $aa-- ){
$cast_stamp_int = 97
$cast_stamp=$stamp.Substring( ($d_stamp -$aa), 1)
#echo $cast_stamp
$cast_stamp_int += [int32] $cast_stamp
$nazev_bat += [char] $cast_stamp_int
}

#echo $nazev_bat"<"
$rnd_znak = Get-Random -Minimum 97 -Maximum 122 # a=97, z=122
#echo $rnd_znak.GetTypeCode()
$nazev_bat += [char] $rnd_znak
#echo $nazev_bat"<<"
#echo $nazev_bat.GetTypeCode()
$nazev_bat += ".bat"
echo $nazev_bat

<#
# zpusob ktrerej nefunguje, protoze provdepodobnost opakovani dvou stejnejch nazvu za sebou neni nulova
# kdezto pri pouziti toho u toho stampu nulova je ( ten de jenom "dopredu" )
$nazev_bat=""
for ($aa = 1; $aa -le 5; $aa++){
$rnd = Get-Random -Minimum 97 -Maximum 122 # a=97, z=122
$nazev_bat += [char] $rnd
# [char] je charakter
}
$nazev_bat += ".bat"
echo $nazev_bat
#>

sleep 10

