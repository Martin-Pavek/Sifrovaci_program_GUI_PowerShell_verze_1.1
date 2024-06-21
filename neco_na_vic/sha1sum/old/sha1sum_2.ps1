cls

# testovani aloritmu v PowerShell

$linux_1 = "9b4c9862a6016744e30d74e36808bcbd592481cb" # pokus1
#           9B4C9862A6016744E30D74E36808BCBD592481CB
$linux_2 = "e9696393cde1261946db3927146864161404d75a" # pokus2
#

$pokus1_sha = Get-FileHash -Path "C:\work\pokus1" -Algorithm SHA1
$pokus1_sha = Get-FileHash -Path "C:\work\pokus2" -Algorithm SHA1

$s1 = $pokus1_sha.Hash
echo $linux_1
echo $s1
#echo $s1.GetTypeCode()

$s2 = $pokus1_sha.Hash
echo $linux_1
echo $2
#echo $s2.GetTypeCode()

sleep 5




