cls
Remove-Variable pole, x, item, x, qq, suma -ErrorAction SilentlyContinue

#$pole = "y", "d", "a", "a", "a", "a", "a", "a", "b", "x"

#$pole = "a", "b", "c", "d", "e", "f", "g", "h", "i", "j"

$pole = "a", "a", "A", "B", "e", "f", "g", "G", "i", "j"

#$pole = "1", "1", "x", "4", "4", "4", "7", "7", "9", "0"
#$pole = "A", "a", "a", "a", "e", "f", "g", "g", "i", "j"

#$pole = "a", "a", "a", "a", "a", "a", "a", "a", "a", "x"
#$pole = "a", "a", "a", "a", "a", "a", "a", "a", "a", "a"

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
sleep 5

