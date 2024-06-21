#cls

$delka_args = $args.length

if ($delka_args -eq 0) {
echo "sha1sum.exe filename"
#sleep 3
Exit
}

$file_name = $path
$file_name += $args[0]
# echo $file_name

if (-not (Test-Path $file_name) ) {
echo "tento soubor neexistuje"
#sleep 3
Exit 1
}

# sha1sum PowerShell, mnou upraveny LowrCase
$pokus2_sha = Get-FileHash -Path "C:\work\pokus2" -Algorithm SHA1
$sha = $pokus2_sha.Hash
$d_sha = $sha.Length
#echo $d_sha

$sha3=""
for ($aa = 0; $aa -le $d_sha -1; $aa++ ) {
#echo $aa
$znak_sha = $sha.Substring($aa,1)
$znak_sha_low = $znak_sha.ToLower()
#echo $znak_sha_low
$sha3 += $znak_sha_low
}

#$sha3="ddd" # test
echo $sha3
#$sha3.GetTypeCode()

