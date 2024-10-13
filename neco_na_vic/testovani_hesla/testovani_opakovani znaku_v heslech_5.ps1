cls

$hesla=@(
"vM2Oa1TbMxAVpFUuCDUHZ7w7pJyEVpdDiEXyuz0ZqiaGSektXu7fS0vwF0hElQVAj6qLxTM2hPeBg1inAYGz2EDSdDpgtf2S3EgX4BA3I4kn2tMIKYsGdDPtNaEEBD"
"pSIhyr8N7HBZU0Ox5DfHizAT48T7jXqYq9f3EsIoT9LMOoWer540Q6vNZ6pa1T5WaSUYwtcxcq8XaeXSO6nB3rxxPXBlGrY9zcA9h0uetERJ5IDduceo1igVkTCiFg"
"Jc0O103hHpmTjlqFSIIos3aoEPeYNaqRb1euEk9WQjbi2mFypulBxB3aZSaKleUAAkrcptfv96ShTJwy3hfrNQJePofWsUxOZHb9q097UOCYvrXp5278wxe3n01sXS"
"yXBhQ0nO31ljemNOo77OBRAtzSEvr6Sc0aZAAIj72yOgQWugY93Xcz38GOsAAnb3RkumqdDaj1vYIOsOFRFpMudkyvHh2wv0h907N97eZ6sGORCpiP1RfxRvA4Ho0f"
"2XP8GyL5xBp84YGzqJfRQf2grY8f6JImYaVKw5xnGkLsdjx8ZJGBWTJJ5vf67TNALStFkyOa7qzPGa9lkcC27uk3PqPBsp3qjcolDP7U2nDc6Unpq8RTF8pKk732pj"
"J07oliZqMBSFp7b8uoIhd7gt2CdTp9svL1xfYjr2xNzSdKDeLaHXuHDIyVK7Ud9Ro7i9WpkfIfRcJeqmPgaBAOJSPkS3S9BluZy1Rekb7jn3o9R3A6Y2RKdpjlfbTe"
"yIOYPrHRcMurhBHr2LHMxCQJW0wgvpQDZtYhMHfjFtK9oXvetTpoP0SUW7OFS1k32zuNysMEUWz3q0oLL4WOAOhJpovd7Sb0kbw3pPfURZ9V8tFjK8aohxToiqqwWm"
"bDixbuWI4l0ZHWGr6eAWmrPe6MZ0HJsKa3iAhPhX5yKNQgQtfBZdUyDC7vnb0GL3MvUKn9oxIexZPd5WOb9FZtkyUXAypEXKzck7vP6wkeh8yZXwCp7eNuRXNhORFJ"
"6eOcZQntt1NB0zwQfLB4Adrl9FeS5I1DOUcSIlwbjRB66J7RzYaK3XDSXv8n1KOUmFuLSukFUjTDGSyd5mTkOOIsNnvlGTimBoBIbPCMbiWmnsCv59vf3bpT25NZFj"
"FdTOQi7bGCUe2Y9DVXMuEeHjeNbX6oqrq2VsPrBGYuyh5BWUjD8GvNvJCYHjEQEiOz1d5zth2GvYl4NY6JWdB57KdlWBjKiEjT8l4QBCRXALlLKHszdVvfm15qHWOD"
)

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

Write-host -ForegroundColor yellow "toto je vypis 10ti pouzitich hesel vzniklych z jednoho souboru klice pod sebou:"
for ( $cc=0; $cc -le $hesla.Length -1; $cc++ ) {
echo $hesla[$cc]
}

$vysledky_string_out_1=""
$vysledky_string_out_2=""
for ( $dd=0; $dd -le $pole_vysledky.Length -1; $dd++ ) {

if ( $pole_vysledky[$dd] -lt 10 ) {
$vysledky_string_out_1 += $pole_vysledky[$dd]
} else {
$vysledky_string_out_1+="1" # kdy je $suma = 10
}

if ( $pole_vysledky[$dd] -lt 10 ) {
$vysledky_string_out_2+=" "
} else {
$vysledky_string_out_2+="0" # kdy je $suma = 10
}
}

Write-host -ForegroundColor Cyan $vysledky_string_out_1
Write-host -ForegroundColor Cyan $vysledky_string_out_2 # radek nuly pro desitky ( paklize $suma = 10 ) jsou dva znaky uz

$total_suma=0
for ($ee=0; $ee -le $pole_vysledky.Length -1; $ee++ ) {
$total_suma+=$pole_vysledky[$ee]
}

#$procent = (291/1260).ToString("P")
$celkem_znaku_v_heslech = (( $hesla[0].Length * $hesla.Length))
$procent = ($total_suma/$celkem_znaku_v_heslech).ToString("P") # toto je specialni vypocet procent ze dvou cisel v PowerShellu
Write-host -ForegroundColor yellow "soucet vsech stejnych znaku ve vsech sloupcich je : $total_suma to je $procent procent z $celkem_znaku_v_heslech znaku celkem"

echo "modre cislo pod kazdym sloupcem ukazuje vzdy pocet stejnejch znaku na pozici N v ruznem heslu, vytvorenym stejnym klicem"
echo "napr. sloupec cislo (1) = 2*y; 2*J pod tim cislo 4, kde je nula tak to znamema ze neopakoval stejny znak v 10ti heslech"
echo 'cim je cislo vetsi tim je to horsi, napr. na pozici 55 je dokonce cislo 8. v druhym hesle uz je znamo ze cislo to a to je "v"'
echo 'takze utocnik po rozlusteni hesla na radku 1 by v hesle na radku cislo 2 uz vedel ze tento klic zde ma pismeno "v" atd.'
echo "da se to vycist z listu archivu *.zip, kde jsou cisla jako reference na policka v matrixu"
echo 'tady by to pak zamenalo ze napr. cislo 20 v listu zipu na prvni pozici znaku hesla v klici "autoruv-klic-cislo-1" je "v" atd.'
echo "cim vic se pouziva stejny klic tim vice se vlastne postupne vyzrazuje jeho obsah samozdrejme paklize by stim chtel nekdo lustit"
echo "heslo je vygenerovano vzdy jine ale klic zustava stejny"
echo "takze tady je vydet priklad pouziti 10x stejneho klice a uvazte samy kde je pro vas jeste mira bezpecnosti"
echo 'samozdrejme plati ze novy klic = opet nulova znalost hesla a pri opakovanem pouziti se cely proces "degradace" znovu opakuje'
echo "takovej napad: mit 53 klicu, protoze rok na 53 tejdnu a kazdej tyden pouzivat jinej klic a na stary uz nesahnout"
echo "a jenom je prekopirovat nekam do zalohy, pochybuju ze by nekdo chtel lustit kazdy teden znovu 126ti mistny heslo"

sleep 10

