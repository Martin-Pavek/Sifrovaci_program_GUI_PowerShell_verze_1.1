cls

###############################################################################
# prevede soubor klice z linux verze 6.2 na klic pro verzi GUI powerShell 1.0 #
###############################################################################

[string] $scriptName = pwd
#$scriptName += "\"
$scriptName += $MyInvocation.MyCommand.Name
$host.UI.RawUI.WindowTitle = $scriptName

$delka_args = $args.length
#echo "celkem args $delka_args"
#$delka_args.GetType() #Int32
 
if ($delka_args -ne 1 ) {
echo "napr."
echo "preved_klic.com linux-klic-cislo-1"
echo ""
echo "upozorneni: takto prevedeni klic jiz nelze zpetne pouzit v verzi lilux-6.2 v teto verzi si program"
echo "kontoluje take kontrolni soucet souboru a ten by uz neodpovidal puvodnimu a program by skoncil chybou"
echo "ve verzi pro PowerShell tato funkce (sha1sum) chyby tudis zde jiz nebyla implementovana"
echo "je zde nejaka funkce GetHashCode() ale je naprosto nepouzitelna"
sleep 30
exit 1
}

[string] $in_file = $args[0]

$in_file_exist = Test-Path -Path $in_file
if ($in_file_exist -like "False") { 
echo "nenalezen soubor $in_file"
echo "konec programu"
sleep 5
exit 1
}

echo $in_file

$out_file = $in_file
$out_file += "-convert"
echo $out_file
sleep 2

$pole_out_file=@()

Remove-Variable pole_in_file -ErrorAction SilentlyContinue

#$pole_in_file = Get-Content -Path "R:\pokus1" -Encoding String
$pole_in_file = Get-Content -Path $in_file -Encoding String

$d_pole_in_file = $pole_in_file.Length
#echo $d_pole_in_file

for ( $aa = 0; $aa -le $d_pole_in_file -1; $aa++ ) {
$radek = $pole_in_file[$aa]
#echo $radek
$hledej_1 = $radek.IndexOf("]=") # int32

if ( $hledej_1 -ne -1 ) {
#echo $radek
$d_radek = $radek.Length
$znak = $radek.Substring($d_radek -2 ,1)
echo $znak
$pole_out_file+=$znak
}
}

<# 
# ukazka funkce GetHashCode()
$file = "C:\Users\DELL\Documents\ps1\_GUI\GUI_RadioButton_select_file\keys\klic-01"
$sum = $file.GetHashCode()
echo $sum
# ani po brutalni editaci souboru klic-01, se hodnota $sum nezmenila, takze nepouzitelne
echo $sum.GetTypeCode()
#>

Set-Content -Path $out_file -Encoding ASCII -Value $pole_out_file

echo "byl vytvoren prevedeny klic $out_file, nakopiruj ho do slozky keys a prejmenuj ho zpet na $in_file"
echo "archivy zip vytvorene jiz drive ve verzi linux6.2 lze nyni za pomoci prevedeneho formatu klice"
echo "rozzipovavat i v teto nove verzi programu napsane v PoweShell"
echo "obracene to nepude, jiz podroneji popisovano"
sleep 30

