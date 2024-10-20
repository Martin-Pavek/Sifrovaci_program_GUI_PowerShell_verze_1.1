cls
Remove-Variable pole, x, item, x, qq, suma -ErrorAction SilentlyContinue

# oprava - radek cilso 6 obsahuje celkem 4x znak "a" ( takze vice nej jednou opakujici se informace)
# je potreba brat pouze stejne dvojice a stoho pak vypocitat procenta, jinak je to zkresleny

$pole = "h","D","M","L","o","S","M","6","o","h","y","Z","E","k","1","c","v","k","2","c","P","P" 
# toto je sloupec 1 ( zadny stejny znak 3x)

#$pole = "1","q","g","o","W","a","I","j","f","I","j","4","4","O","A","a","a","M","a","M","6","W","O","u"
# toto je sloupec 6 ( 4x znak "a", cili vlastne o dva znaky mene, potreba je 2 stejne pouze )
# takze vlastne brat 4-2 (pokud je o znak "a" )



$x=@()
$x += $pole | Group -CaseSensitive | Where{$_.Count -gt 1} | Select-Object Count
# paklize nejni prepinac "-CaseSensitive" povazuje napr. "d" a "D" za stejnej znak !
# takze default je CaseSensitive  off
echo $pole | Group -CaseSensitive #| Select-Object Count, Group
echo $x.Length

$suma=0
if ( $x.Length -ne 0 ) {
foreach ( $item in $x ) {
#echo $item
[string] $qq = $item
echo $qq"<"
$suma += [int32] $qq.Substring(8,$qq.Length -9)
}
}

echo $suma"<--stejnejch znaku v poly celkem"
echo "toto je sloupec cislo 1 a je v pohode nic se neopakuje vice nezli 2x"
echo "takze je spravne je 2x6 znaku tj. 12 "
sleep 20


