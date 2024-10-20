cls
Remove-Variable pole, x, item, x, qq, suma -ErrorAction SilentlyContinue

# oprava - radek cilso 6 obsahuje celkem 4x znak "a" ( takze vice nej jednou opakujici se informace)
# je potreba brat pouze stejne dvojice a stoho pak vypocitat procenta, jinak je to zkresleny

#$pole = "h","D","M","L","o","S","M","6","o","h","y","Z","E","k","1","c","v","k","2","c","P","P" 
# toto je sloupec 1 ( zadny stejny znak 3x)

 #$pole = "1","q","g","o","W","a","I","j","f","I","j","4","4","O","A","a","a","M","a","M","6","W","O","u" # 16-2 (4x"a")


 #$pole = "a","a","b","b","c","c"
 $pole = "a","a","b","b","b","c","c","c"

#$pole = "1","q","g","o","W","X","I","j","f","I","j","4","4","O","A","z","a","M","a","M","6","W","O","u"
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

# toto odsud opraveno 20.10.2024
# a dela to ze kdyz se neco opakuje vece nezli 1x tak ostatni stejne opakovani anuluje
$qqq = [int32] $qq.Substring(8,$qq.Length -9)
if ( $qqq -gt 2 ){ 
$qqq = 2
$suma += $qqq
}else{
$suma += [int32] $qq.Substring(8,$qq.Length -9)
}
# a az sem, tady to konci 20.10.2024

}
}

echo $suma"<--stejnejch znaku v poly celkem"
sleep 20


