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

echo [byte][char] "a"
echo [byte][char] "A"
[byte][char] "a" -eq [byte][char] "A" # False
# Byte	0 to 255	Unsigned 8-bit
# https://devblogs.microsoft.com/scripting/understanding-numbers-in-powershell/
echo [byte]::MinValue
echo [byte]::MaxValue

$xx = [byte][char]"a"; $xx.GetType() ;echo $xx

sleep 10

