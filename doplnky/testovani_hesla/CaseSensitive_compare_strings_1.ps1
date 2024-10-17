cls
# dalsi vec, porovani stringu bez a z CaseSensitive -ceq operatorem ( default je off )
"a" -like "a"
"a" -like "A"
#
"aa" -like "aa"
"aa" -like "AA"
#
"a" -clike "a"
"a" -clike "A" # False
"a" -eq "a"
"a" -eq "A"
#
echo 'CaseSensitive compare strings "-ceq" oparator'

"a" -ceq "a" # stejne 
"a" -ceq "A" # tady uz dobre, vylozene se mu musi rict aby rozlisoval velky a maly znaky !
"aA" -like "Aa"
"aA" -clike "Aa"
"aA" -like "aA"

#------- nebo da se to obejit pres hodnotu znaku v ascii a porvnava na jako 2x int

[int16][char] "a"
[int16][char] "A"
[int16][char] "a" -eq [int16][char] "A" # False

$xx = [int16][char]"a"; $xx.GetType() ;echo $xx

sleep 10
