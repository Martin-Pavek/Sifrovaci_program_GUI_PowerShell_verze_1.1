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

"a" -ceq "a"
"a" -ceq "A" # tady uz dobre, vylozene se mu musi rict aby rozlisoval velky a maly znaky !
"aA" -like "Aa"
"aA" -clike "Aa"
"aA" -like "aA"

sleep 10

