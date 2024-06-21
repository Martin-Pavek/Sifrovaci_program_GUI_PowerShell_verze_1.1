cls
# v zahlavi spusteneho okna zobrazi informoce ( neco jako echo $0 v bash )
[string] $scriptName = pwd
#$scriptName += "\"
$scriptName += $MyInvocation.MyCommand.Name
$host.UI.RawUI.WindowTitle = $scriptName

[string]$path = "$pwd"
$path += "\10_klicu.bat"

echo $path

#exit 1

$stream = [System.IO.StreamWriter]::new($path)

for ( $i=1; $i -le 10; $i++ ) {
$i2=[string] $i
$d_i=$i2.Length
#echo $d_i

$out=""

if ( $d_i -eq 1 ) {
$out="0"
$out+=$i2
}else{
$out=$i2
}
#echo "klic-$out.txt"
#echo "powershell -File generuj_klic_9_zacatek_10-3-args_3.ps1 klic-$out.txt"
#echo "generuj_klic.com klic-$out"
$out_2 = ""
#$out_2 = "PowerShell -File "
#$out_2 += "./generuj_klic_9_zacatek_10-3-args_8.ps1 "
$out_2 += "generuj_klic.com "
$out_2 += "klic-"
$out_2 += $out
echo $out_2
$stream.WriteLine("$out_2")
}

$stream.close()
sleep 2

# .\99_klicu.ps1 > a.bat
# unix2dos a.bat !!!

