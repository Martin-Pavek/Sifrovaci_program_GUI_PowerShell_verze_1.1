cls

$delka_args = $args.length
#echo "celkem args $delka_args"
 
if ($delka_args -ne 2) {
echo ".\qs10.ps1 10 100"
echo "10 = pocet cisel"
echo "100 = cisla od -100 do 100"
echo "presmerovani vystupu na ramdisk"
echo ".\qs10.ps1 10 100 > R:\qs10-out-20.txt"
#sleep 10
Exit
}

[int32] $max = $args[0]
#$max = $args[0]
$o1="args[0]="
$o1+=$max.GetTypeCode()
echo $o1

[int32] $maximum = $args[1]
#$maximum = $args[1]
$o2="args[1]="
$o2 += $maximum.GetTypeCode()
echo $o2

$minimum = $args[1] - (( 2 * $args[1] ))
echo "hodnota minimum = $minimum"
$o3="promena minimum = "
$o3+=$minimum.GetTypeCode()
echo $o3
#echo "hodnota minimum = $minimum"


#echo "$maximum, $minimum"
#exit
sleep 5


function quicksort($in) {
    $n = $in.count
    switch ($n) {
        0 {}
        1 { $in[0] }
        2 { if ($in[0] -lt $in[1]) {$in[0], $in[1]} else {$in[1], $in[0]} }
        default {
            $anchor = $in | get-random
            $lt = $in | ? {$_ -lt $anchor}
            $eq = $in | ? {$_ -eq $anchor}
            $gt = $in | ? {$_ -gt $anchor}
            @(quicksort $lt) + @($eq) + @(quicksort $gt)
        }
    }
}

$pole_rnd = @()
$poc=1
$mezera="   "
echo "PowerShell quicksort algoritmus"
echo "cisla od $minimum do $maximum pocet cisel = $max"
#echo "puvodni  setridene"
echo "    puvodni                  setridene"

for ($aa = 1; $aa -le $max; $aa++) {
#$rnd =  Get-Random -Minimum -1000.0 -Maximum 1000.0
$rnd =  Get-Random -Minimum $minimum -Maximum $maximum
$pole_rnd+=$rnd
#echo $rnd
}

$pole_serazene = @()
$pole_serazene += quicksort $pole_rnd

   for ($bb = 0; $bb -le ($pole_serazene.length - 1); $bb ++) {
   #echo $pole_serazene[$bb]


[string] $out=$poc
$out += $mezera
$out += $pole_rnd[$bb]
$out += $mezera
$out += $pole_serazene[$bb]

echo $out
$poc++
}


Remove-Variable rnd
Remove-Variable pole_rnd
Remove-Variable pole_serazene

#.\qs10.ps1 10 100 > R:\qs10-out-10.txt
#.\qs10.ps1 10 999.9

sleep 10


