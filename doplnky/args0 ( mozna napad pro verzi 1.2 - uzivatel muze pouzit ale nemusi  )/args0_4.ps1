cls

# predani parametu args[0] pres zastupce programu ve Windows

# .\args0_3.ps1 "E:\keys" # absolutni cesta ( absolutni cesta je cesta z korenoveho adresare )
# v tomhle pripade "e:\"  ( nebo C:\ apod. )

# .\args0_3.ps1 bez argumetnu priradi "./keys" relativni cesta
# spusten napr. zasifruj.exe a v miste kde je soubor zasifruj.exe je slozka z nazvem "keys"
# a do ty se rekne programu zasifruj.exe "do tyhle slozky vlez a hledej vni klice"

$default = "./keys" # relatibni cesta

if ( $args[0].length -eq 0 ){
echo "nenalezen args[0]"
$args+="" # prida praznej klic kdez je args[0].length = 0 ( pole jako kazdy jiny )
$args[0]=$default # prida hodnotu klice do args[0] = "./keys" tzn. kdyz neni zadnej argument prirad hodnotu Default
echo 'pro args[0] nastavena defaultni hodnota "./keys"'
#echo $args[0].GetTypeCode()
}else{
# naopak paklize existuje args[0]
echo "nalezen args[0]"
}

$o1 = 'args[0]'
$o1+=" ma hodnotu :"
$o1 += $args[0]
echo $o1
echo $args[0].GetTypeCode()
sleep 10
####  odud program ####



