cls

# testovani aloritmu v PowerShell

$linux_1 = "9b4c9862a6016744e30d74e36808bcbd592481cb" # pokus1
#           9B4C9862A6016744E30D74E36808BCBD592481CB
$linux_2 = "e9696393cde1261946db3927146864161404d75a" # pokus2
#

$pokus1_sha = Get-FileHash -Path "C:\work\pokus1" -Algorithm SHA1
$pokus2_sha = Get-FileHash -Path "C:\work\pokus2" -Algorithm SHA1

$sha = $pokus1_sha.Hash
echo $linux_1
echo $sha
#echo "1234567890123456789012345678901234567890"

#echo $s11.length

# narozdil od sha1sum v linuxu ma sha1sum v PowerShelu velky pismena misto malejch
# takze prevedeno funkci ToLower na maly pismena

$sha3=""

for ($aa = 0; $aa -le $d_sha.length -1; $aa++ ) {
#echo $aa
$znak_sha = $sha.Substring($aa,1)
$znak_sha_low = $znak_sha.ToLower()
#echo $znak_sha_low
$sha3 += $znak_sha_low
#echo $sha[$aa]
#$znak = $sha[$aa]

#echo $znak.GetTypeCode()
#$sha3 += $sha[$aa].ToLower()
}

echo $sha3
#echo $sha3.GetTypeCode()
 
#if ( $linux_1 -like $sha2 ) {
if ( $linux_1 -like $sha3 ) {
echo "stejne"
}else{
echo "ruzne"
}


exit 1

<#
echo "-----------------------------"
$s2 = $pokus2_sha.Hash
echo $linux_2
echo $s2
#echo $s2.GetTypeCode()
#>

sleep 5




