cls
function screenshot($path){
  $width = 0;
  $height = 0;
  $workingAreaX = 0;
  $workingAreaY = 0;

  $screen = [System.Windows.Forms.Screen]::AllScreens;

  foreach ($item in $screen)
  {
    if($workingAreaX -gt $item.WorkingArea.X)
    {
      $workingAreaX = $item.WorkingArea.X;
    }

    if($workingAreaY -gt $item.WorkingArea.Y)
    {
      $workingAreaY = $item.WorkingArea.Y;
    }

    $width = $width + $item.Bounds.Width;

    if($item.Bounds.Height -gt $height)
    {
      $height = $item.Bounds.Height;
    }
  }

  $bounds = [Drawing.Rectangle]::FromLTRB($workingAreaX, $workingAreaY, $width, $height);
  $bmp = New-Object Drawing.Bitmap $width, $height;
  $graphics = [Drawing.Graphics]::FromImage($bmp);

  $graphics.CopyFromScreen($bounds.Location, [Drawing.Point]::Empty, $bounds.size);

  $bmp.Save($path);

  $graphics.Dispose();
  $bmp.Dispose();
} # konec funkce screenshot
# tohle to nak funguje jenom v editoru ?
#Remove-Variable i ,ii -ErrorAction SilentlyContinue

######################################
# nacteni zvoleneho klice do matrixu
######################################

# Remove-Variable matrix, nazev_klice -ErrorAction SilentlyContinue
$matrix=[System.Collections.ArrayList]::new()

# prazdny matrix 62 vodorovne a 126 svisle
for ( $dd2 = 0; $dd2 -le 125; $dd2++ ) {
#delka 62
$matrix.Add(@("","","","","","","","","","","","","","","","","","","","","","","","","","","","","",
"","","","","","","","","","",
"","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","")) > $null
# bez > $null vypise 0-125 radek
}

$poc=1
# tady menit kterej klic se nacte z adresare keys
#$nazev_klice="C:\Users\DELL\Documents\ps1\_GUI\Sifrovaci_program_GUI_PowerShell_verze_1.1\keys\novej_1"
#$nazev_klice="C:\Users\DELL\Documents\ps1\_GUI\Sifrovaci_program_GUI_PowerShell_verze_1.1\keys\autoruv-klic-cislo-1"
#$nazev_klice="C:\Users\DELL\Documents\ps1\_GUI\Sifrovaci_program_GUI_PowerShell_verze_1.1\keys\autoruv-klic-cislo-2"
$nazev_klice="C:\Users\DELL\Documents\ps1\_GUI\Sifrovaci_program_GUI_PowerShell_verze_1.1\keys\autoruv-klic-cislo-3"

$stream_reader_1 = [System.IO.StreamReader]::new($nazev_klice)

for ( $dd = 0; $dd -le 125; $dd++){
for ( $ee = 10; $ee -le 71; $ee++){
$line_read = ($stream_reader_1.ReadLine()) 
$in = ""
$in = '$matrix'
$in += "["
$in += $dd
$in += "]["
$in += $ee
$in += ']="'
$in += $matrix[$dd][$ee]
$in += $line_read
$in +='"'
echo $in
$matrix[$dd][$ee]=$line_read
$poc++
}
}

$stream_reader_1.close()
sleep 3
cls

$hesla_old=@()

# tady menit $max to je kolik bude celkem hesel pod sebou ve vypisu
$max=40
#

for ( $x=1; $x -le $max; $x++){ 
$heslo_pro_zazipovani=""

for ($ff = 0; $ff -le 125; $ff++) {
#echo $ff
$rnd_num = Get-Random -Minimum 10 -Maximum 71
#echo $rnd_num
$reference_na_heslo += [string] $rnd_num
$heslo_pro_zazipovani += $matrix[$ff][$rnd_num]
}

$hesla_old+=$heslo_pro_zazipovani
}


$hesla=@()
$hesla+=$hesla_old[0]

$d_hesla_old=$hesla_old.Length
#echo $d_hesla_old=$hesla_old

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

<#
$suma=0
if ( $x.Length -ne 0 ) {
foreach ( $item in $x ) {
[string] $qq = $item
#echo $qq
$suma += [int32] $qq.Substring(8,$qq.Length -9)
}
}
#>

# toto odsud opraveno 20.10.2024
# a dela to ze kdyz se neco opakuje vece nezli 1x tak ostatni stejne opakovani anuluje
$suma=0
if ( $x.Length -ne 0 ) {
foreach ( $item in $x ) {
#echo $item
[string] $qq = $item
#echo $qq"<"
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

sleep 2

$dt="Screenshot-"
$dt += (get-date).ToString("dd_MM_yyyy_HH-mm-ss");
screenshot "$dt.jpg"
sleep 1

cls
} # for i




