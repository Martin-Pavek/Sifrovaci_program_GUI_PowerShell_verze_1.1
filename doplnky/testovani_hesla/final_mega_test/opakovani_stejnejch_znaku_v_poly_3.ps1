cls
Remove-Variable pole, x, item, x, qq, suma -ErrorAction SilentlyContinue

# TADY NOVINKA
# prevadi string do pole, aby se to nemuselo delat rucne
#$str = "aabbbccc"
#$str = "aew7XiWfre8RRX8rl"
$str = "hPJkS2vg21vJhDZwRPFZSnRShlS7LUlU6EyZ" # Screenshot-20_10_2024_20-01-11.jpg - sloupec cislo 1 (modra 20 pod tim)
echo $str.Length
$pole = $str.ToCharArray()
#echo $pole

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

