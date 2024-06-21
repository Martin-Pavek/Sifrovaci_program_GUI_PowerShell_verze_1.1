cls

[string] $stamp = [DateTimeOffset]::Now.ToUnixTimeseconds()
echo $stamp
$d_stamp = $stamp.Length
$nazev_bat=""

for ($aa = 4; $aa -ge 1; $aa-- ){
$cast_stamp_int = 97
$cast_stamp=$stamp.Substring( ($d_stamp -$aa), 1)
#echo $cast_stamp
$cast_stamp_int += [int32] $cast_stamp
$nazev_bat += [char] $cast_stamp_int
}

echo $nazev_bat"<"
$rnd_znak = Get-Random -Minimum 97 -Maximum 122 # a=97, z=122
echo $rnd_znak.GetTypeCode()
$nazev_bat += [char] $rnd_znak
echo $nazev_bat"<<"
#echo $nazev_bat.GetTypeCode()
$nazev_bat += ".bat"
echo $nazev_bat"<<<"

