cls

[string] $pwd2 = Get-Location # kdyz nejni [string] dela kraviny
#$pwd2+="\"
# kdyz jsem na ramdisku je pak cesta "R:\\", jinde je zase napr. "R:\aaa\"
if ($pwd2.Length -ne 3){
# dela vsude stejny tzn "R:\" ; "R:\aaa\"; "E:\"; "E:\aaa\"
$pwd2+="\"
}


if ($pwd2.Length -ge 5){
#echo $pwd2"<<"
}else{
Write-Warning "spatna cesta $pwd2"
sleep 5
Exit
}


#for ($aa = 0; $aa -le ($pwd2.length); $aa ++) {
for ($aa = ($pwd2.Length-2); $aa -ge 0; $aa--) {
$znak=$pwd2[$aa]
#echo $znak
if ( $znak -like "\") {
$nalez_1=$aa
break

}
}

#echo $nalez_1" < --"
# R:\abcdefgh\12345>
# 012345678901234567
#$fold=$pwd2.Substring($nalez_1, $pwd2.Length - $nalez_1)
$fold=$pwd2.Substring($nalez_1 + 1, $pwd2.Length - $nalez_1 - 2)
#echo $fold"<--"


$array=@()

$array+="@echo off"
$array+="del _TREE_folder_"+$fold+".txt"
#$array+=$fold
#$array+=".txt"
$array+="sleep 1"

$array+="date /t > "+$pwd2+"_TREE_folder_"+$fold+".txt"
$array+="time /t >> "+$pwd2+"_TREE_folder_"+$fold+".txt"
$array+="tree /F /A "+$pwd2+" >> "+$pwd2+"_TREE_folder_"+$fold+".txt"
$array+="@echo on"
$array+="REM pause"


<#
@echo off
del _TREE_folder_PDF.txt
sleep 1
date /t > C:\Users\DELL\Documents\PDF\_TREE_folder_PDF.txt
time /t >> C:\Users\DELL\Documents\PDF\_TREE_folder_PDF.txt
tree /F /A C:\Users\DELL\Documents\PDF\ >> C:\Users\DELL\Documents\PDF\_TREE_folder_PDF.txt
@echo on
REM pause
#>


for ($bb = 0; $bb -le ($array.length - 1); $bb ++) {
echo $array[$bb]
}


#Set-Content -Path R:\myfile.txt -Encoding ASCII -Value $table
$file_bat_name="_TREE.bat"

Set-Content -Path $pwd2$file_bat_name -Encoding ASCII -Value $array


Write-Host -ForegroundColor Yellow "nyni spust nove vznikly soubor _TREE.bat"
sleep 10

