cls
Remove-Variable i ,ii -ErrorAction SilentlyContinue
$hesla_old=@(
"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"
)

$hesla=@()
$hesla+=$hesla_old[0]

$d_hesla_old=$hesla_old.Length

for ( $i=1; $i -le $d_hesla_old -1; $i++ ){
#echo (($i +1))
$hesla+=$hesla_old[$i]

<# nahore v poly $hesla je 10 hesel k archivum zip vse vytvoreno jednim klicem - autoruv-klic-cislo-1
   bude se testovat opakovani znaku na pozici 0,1,2,3 atd. v ruznych heslech jak jdou po sobe 
#>  

$pole_vysledky=@()

for ( $aa=0; $aa -le $hesla[0].Length -1; $aa++ ) { # delka kazdeho hesla je 0-125 znaku ( 126 zanku celkem )
$pole_jeden_sloupec_ze_vsech_hesel=@()

for ( $bb=0; $bb -le $hesla.Length -1; $bb++ ) {
$pole_jeden_sloupec_ze_vsech_hesel+=$hesla[$bb].Substring($aa,1)
}

#echo $pole_jeden_sloupec_ze_vsech_hesel
Remove-Variable pole, x, item, x, qq, suma -ErrorAction SilentlyContinue

$x=@()
#$x += $pole_jeden_sloupec_ze_vsech_hesel | Group | Where{$_.Count -gt 1} | Select-Object Count
$x += $pole_jeden_sloupec_ze_vsech_hesel | Group -CaseSensitive | Where{$_.Count -gt 1} | Select-Object Count
# paklize nejni prepinac "-CaseSensitive" povazuje napr. "d" a "D" za stejnej znak !!!
# takze default je CaseSensitive  off

$suma=0
if ( $x.Length -ne 0 ) {
foreach ( $item in $x ) {
[string] $qq = $item
#echo $qq
$suma += [int32] $qq.Substring(8,$qq.Length -9)
}
}

#echo $suma
$pole_vysledky+=$suma
}

$ii=(($i+1))
Write-host -ForegroundColor yellow "toto je vypis $ii pouzitich hesel vzniklych z jednoho souboru klice pod sebou:"
for ( $cc=0; $cc -le $hesla.Length -1; $cc++ ) {
echo $hesla[$cc]
}

$vysledky_string_out_1=""
$vysledky_string_out_2=""
for ( $dd=0; $dd -le $pole_vysledky.Length -1; $dd++ ) {

if ( $pole_vysledky[$dd] -lt 10 ) {
$vysledky_string_out_1 += $pole_vysledky[$dd]
} else {
$vloz_1 = [string] $pole_vysledky[$dd]
$vloz_1 = $vloz_1.Substring(0,1)
$vysledky_string_out_1+=$vloz_1 # kdy je $suma >= 10
#$vysledky_string_out_1+="1" # kdy je $suma >= 10
}

if ( $pole_vysledky[$dd] -lt 10 ) {
$vysledky_string_out_2+=" "
} else {
$vloz_2 = [string] $pole_vysledky[$dd]
$vloz_2 = $vloz_2.Substring(1,1)
$vysledky_string_out_2+=$vloz_2 # kdy je $suma >= 10
#$vysledky_string_out_2+="0" # kdy je $suma >= 10
}
}

Write-host -ForegroundColor Cyan $vysledky_string_out_1
Write-host -ForegroundColor Cyan $vysledky_string_out_2 # radek nuly pro desitky ( paklize $suma >= 10 ) jsou dva znaky uz

$total_suma=0
for ($ee=0; $ee -le $pole_vysledky.Length -1; $ee++ ) {
$total_suma+=$pole_vysledky[$ee]
}

#$procent = (291/1260).ToString("P")
$celkem_znaku_v_heslech = (( $hesla[0].Length * $hesla.Length))
$procent = ($total_suma/$celkem_znaku_v_heslech).ToString("P") # toto je specialni vypocet procent ze dvou cisel v PowerShellu
Write-host -ForegroundColor yellow "soucet vsech stejnych znaku ve vsech sloupcich je : $total_suma to je $procent procent z $celkem_znaku_v_heslech znaku celkem"

sleep 10
cls
} # for i


