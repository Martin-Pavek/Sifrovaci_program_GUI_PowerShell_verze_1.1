cls

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
