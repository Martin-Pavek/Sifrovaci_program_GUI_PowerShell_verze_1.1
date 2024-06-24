cls
# funguje ! vymaze vsechny uzivatelsky dfinovane premenne ve scriptu
# tzn. ze opakovany spusteni zacina znovu jako od "nuly" !

# start of script ( store list existing variable names )
$ExistingVariables = Get-Variable | Select-Object -ExpandProperty Name

<#
you script here
#>

echo "---------- list nove nadefinovane  promenne --------------"
$a=10
echo $a

$b=20
echo $b

$c=30
echo $c

$str_1="ahoj"
echo $str_1

$d_str_1 = $str_1.Length
echo $d_str_1

$t_str_1 = $str_1.GetTypeCode()
echo $t_str_1

$pole_1=@("1","2","3","4")
echo $pole_1

$pole_2=@(10,20,20,40)
echo $pole_2

for ($aa=0; $aa -le 5;$aa++){}

for ($aa_1=0; $aa_1 -le 5;$aa_1++){}

for ($bb=0; $bb -le 5;$bb++){}



# End of script ( remove new variables )
$NewVariables = Get-Variable | Select-Object -ExpandProperty Name | Where-Object {$ExistingVariables -notcontains $_ -and $_ -ne "ExistingVariables"}
if ( $NewVariables ) {
#Write-Host "vymazu vsechny tyto preomenne: `n`n$NewVariables" # to "n$" tady dela newline
Write-Host "vymazu vsechny tyto promenne: `n`n$NewVariables" # 'n'n$ - nalepeny na sobe neda newline | `n` n$ ( nedela newline )
Remove-Variable $NewVariables
} else {
Write-Host "No new variable to remove !"
}

echo "zaroven to vlastne dela i soupis vseho co bylo pouzity, protoze kolikrat si clovek uz ani nepamatuje"

echo "--------- list po vymazani zacatek ---------------------"
echo $a
echo $b

echo $str_1
echo $d_str_1
echo $t_str_1

echo $pole_1
echo $pole_2

echo $aa
echo $aa_1
echo $bb


echo "--------- list po vymazani konec -----------------------"
#sleep 20



