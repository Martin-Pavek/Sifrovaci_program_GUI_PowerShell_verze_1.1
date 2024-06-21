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

# soubor existuje

echo "sha1sum - $file_name"
# sha1sum ziskany z ubuntu
$cmd = ("ubuntu.exe")
$cmd_output = ""

#$cmd_output +=  & $cmd "run" "sha1sum /mnt/r/pokus2"
$cmd_output +=  & $cmd "run" "$file_name"
echo $cmd_output"<"
$cmd_output_2 = $cmd_output.Substring(0,40)
echo $cmd_output_2"-Ubuntu"
#$d_cmd_output = $cmd_output.Length

# sha1sum PowerShell, mnou upraveny
$pokus2_sha = Get-FileHash -Path $file_name -Algorithm SHA1
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
echo $sha3"-PoweShell"
#$sha3.GetTypeCode()

#if ( $linux_1 -like $sha2 ) {
if ( $sha -like $sha3 ) {
echo "stejne"
}else{
echo "ruzne"
}

