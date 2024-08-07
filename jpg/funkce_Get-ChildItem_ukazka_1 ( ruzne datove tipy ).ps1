cls
# ruzne datove typy
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

$x = Get-ChildItem -Path $cesta -Name
echo $x.GetType()
echo "------------------------------------------------------------------------"

}


<# output


R:\Prazdny\
You cannot call a method on a null-valued expression.
At C:\work\Untitled3.ps1:19 char:1
+ echo $x.GetType()
+ ~~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidOperation: (:) [], RuntimeException
    + FullyQualifiedErrorId : InvokeMethodOnNull
 
------------------------------------------------------------------------
R:\jeden-soubor\

IsPublic IsSerial Name                                     BaseType                                                                
-------- -------- ----                                     --------                                                                
True     True     String                                   System.Object                                                           
------------------------------------------------------------------------
R:\dva-soubory\
True     True     Object[]                                 System.Array                                                            
------------------------------------------------------------------------
R:\jedna-slozka\
True     True     String                                   System.Object                                                           
------------------------------------------------------------------------
R:\dve slozky\
True     True     Object[]                                 System.Array                                                            
------------------------------------------------------------------------



PS R:\> 


#>
