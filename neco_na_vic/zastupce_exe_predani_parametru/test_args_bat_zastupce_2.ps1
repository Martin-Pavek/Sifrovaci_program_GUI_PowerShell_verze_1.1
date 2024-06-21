cls

# .\args_3.ps1 a b "c d"

$delka_args = $args.length
echo "celkem $delka_args argumentu" # int32
echo "--------------------"
if ($delka_args -eq 0) { #int32
echo "zadny argument"
sleep 1
Exit
}

for ($aa = 0; $aa -le ($delka_args - 1); $aa ++) {
$k = "args["
$k += $aa
$k +="]"
$k += "="
$k += '"'
$k += $args[$aa]
$kk = $args[$aa].GetTypecode()
$k += '"'
echo $k" "$kk
}
echo "--------------------"
$o1="0-"
$o1+=$delka_args - 1
echo $o1

$p=@(
"a toto pri zadani z editoru",
"celkem 6 argumentu",
"--------------------",
'args[0]="a" String'
'args[1]="b" String',
'args[2]="2" Int32',
'args[3]="3" Int32',
'args[4]="4" Int32',
'args[5]="c" String',
"--------------------",
"0-5",
"0-5",
"PS R:\> .\args_3.ps1 a b 2 3 4 c"
)

for ( $xx = 0; $xx -le $p.length -1; $xx++ ) {
echo $p[$xx]
}





