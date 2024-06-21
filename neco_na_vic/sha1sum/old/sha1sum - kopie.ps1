$delka_args = $args.length
if ($delka_args -eq 0) {
echo "sha1sum.exe filename"
Exit 1
}
$file_name = $path
$file_name += $args[0]
if (-not (Test-Path $file_name) ) {
echo "tento soubor neexistuje"
Exit 1
}
$pokus2_sha = Get-FileHash -Path $file_name -Algorithm SHA1
$sha = $pokus2_sha.Hash
$d_sha = $sha.Length
$sha3=""
for ($aa = 0; $aa -le $d_sha -1; $aa++ ) {
$znak_sha = $sha.Substring($aa,1)
$znak_sha_low = $znak_sha.ToLower()
$sha3 += $znak_sha_low
}
echo $sha3