cls
# sjednoceno, vzdy Array
$disk="R:\"

$f = @()
$f += "Prazdny" # pise chybu pri $x.GetType() - You cannot call a method on a null-valued expression.
$f += "jeden-soubor"
$f += "dva-soubory"
$f += "jedna-slozka"
$f += "dve slozky"

for ( $aa = 0; $aa -le $f.Length -1; $aa++ ) {
$cesta = $disk
$cesta += $f[$aa]
$cesta += "\"
echo $cesta

$x=@() # definovano prazdne pole $x
$x += Get-ChildItem -Path $cesta -Name # rozdil oproti predchozimu prikladu, pridano do pole $x jako klic pole
echo $x.GetType()
echo $x.Length
echo "------------------------------------------------------------------------"

}


<# output 

R:\Prazdny\

IsPublic IsSerial Name                                     BaseType                                                                
-------- -------- ----                                     --------                                                                
True     True     Object[]                                 System.Array                                                            
0
------------------------------------------------------------------------
R:\jeden-soubor\
True     True     Object[]                                 System.Array                                                            
1
------------------------------------------------------------------------
R:\dva-soubory\
True     True     Object[]                                 System.Array                                                            
2
------------------------------------------------------------------------
R:\jedna-slozka\
True     True     Object[]                                 System.Array                                                            
1
------------------------------------------------------------------------
R:\dve slozky\
True     True     Object[]                                 System.Array                                                            
2
------------------------------------------------------------------------



PS R:\> 



takto jiz vzdy ma promena $x type array, za vsech okolnosti



#>
