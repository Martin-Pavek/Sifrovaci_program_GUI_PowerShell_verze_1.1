cls
# v zahlavi spusteneho okna zobrazi informoce ( neco jako echo $0 v bash )
[string] $scriptName = pwd
#$scriptName += "\"
$scriptName += $MyInvocation.MyCommand.Name
$host.UI.RawUI.WindowTitle = $scriptName

[string]$path = "$pwd"
$path += "\100_klicu.bat"

echo $path

#exit 1

$stream = [System.IO.StreamWriter]::new($path)

for ( $i=1; $i -le 99; $i++ ) {
$i2=[string] $i
$d_i=$i2.Length
#echo $d_i

$out=""
if ( $d_i -eq 1 ) {
$out="00"
$out+=$i2
}elseif ( $d_i -eq 2 ) {
$out="0"
$out+=$i2
}
#echo "klic-$out.txt"
#echo "powershell -File generuj_klic_9_zacatek_10-3-args_3.ps1 klic-$out.txt"
#echo "generuj.com klic-$out"
$out_2 = ""
#$out_2 = "PowerShell -File "
#$out_2 += "./generuj_klic_9_zacatek_10-3-args_8.ps1 "
$out_2 += "generuj_klic.com "
$out_2 += "klic-"
$out_2 += $out
echo $out_2
$stream.WriteLine("$out_2")
}

$out_2 = "generuj_klic.com klic-100"
echo $out_2
$stream.WriteLine("$out_2")

$stream.close()
sleep 2

# .\99_klicu.ps1 > a.bat
# unix2dos a.bat !!!

