cls

#$pole = @("09", "10", "01", "02","03" )
#$pole = @("09", "10", "02", "05", "07", "06", "01", "11", "03", "08", "04", "09")
$pole = @("09", "10","02", "05","07", "06","01", "11", "03", "08", "04", "09" ,"ac", "ab","aa", "bb", "ba", "bc","cb", "cc", "ca")

$d_pole = $pole.Length -1
#echo $d_pole

echo "-------- puvodni pole ------------------"
for ( $aa = 0; $aa -le $d_pole; $aa++ ) {
echo $pole[$aa]
}

# muze i sam sebe jako treba a=a+1 apod.
# nejni potreba davat napr. $pole2 = $pole | Sort-Object
#$pole =  $pole | Sort-Object -Property Name # neudela nic
$pole = $pole | Sort-Object # nejlepsi zatim tohle

echo "-------- sedridene pole ------------------"
for ( $bb = 0; $bb -le $d_pole; $bb++ ) {
echo $pole[$bb]
}

sleep 10

