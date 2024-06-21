cls
# bude zobrazovat nahodne tipy, pri kazdem spusteni programu, vybere pomoci RND jede tip
# z $pole_tipy a zobrazi ho vyrazne zlute v outputu
$pole_tipy=@()
$pole_tipy += "Tip 1: Zaskrtnete nejake policko RadioButtonu a misto tlacitka [ OK ] stisknete klavesu [ Enter ], vysledek bude stejny"
$pole_tipy += "Tip 2: Soubory zip.exe a unzip.exe jsou starsi verze programu jako je napr. WinZip a daji se pouzivat zdarma"
$pole_tipy += "Tip 3: Soubory zip.exe a unzip exe, muzete nakopirovat do slozky C:\Windows\"
$pole_tipy += "Tip 4: Soubor 10_klicu.bat a 100_klicu.bat vygeneruji v adresari keys prislusni pocet novych klicu, ty si pak prejmenujte podle sebe"
$pole_tipy += "Tip 4: Soubor 10_klicu.bat a 100_klicu.bat vygeneruji v adresari keys prislusni pocet novych klicu, ty si pak prejmenujte podle sebe"
$pole_tipy += "Tip 5: Miximalni delka nazvu klice, archivu zip (vcetne pripony) je omezena na znaku na 73 znaku"
$pole_tipy += "Tip 5: Miximalni delka nazvu klice, archivu zip (vcetne pripony) je omezena na znaku na 73 znaku"
# schvalve 2x stejny, bude dvojnasobna sance na zobrazeni pri random[key]
$pole_tipy += "Tip 6: Nazvy klicu a archivu zip delsich nez 73 znaku bude program ignorovat az do doby jejich upravy,zkracenim jejich delky"
$pole_tipy += "Tip 6: Nazvy klicu a archivu zip delsich nez 73 znaku bude program ignorovat az do doby jejich upravy,zkracenim jejich delky"
$pole_tipy += "Tip 7: Nepouzivejne v nazvech (cehokoliv) znak mezera, znak mezera nahrazujte znakem podtrzitko"
$pole_tipy += "Tip 8: V adresari keys mejte jen soubory klicu, nevytvarejte vnem dalsi podadresare"
$pole_tipy += "Tip 9: Adresar keys neprejmenovavejte a nepresouvejte jinam, je pro beh programu nezbytni"
$pole_tipy += "Tip 10: Adresar keys ma univerzalni nazev a program ho nebude zahnovat do nabidky vyberu adresare"
$pole_tipy += "Tip 11: Autor nedoporucuje pouzivat diakritiku a nazvech klicu, adresaru a archivu"
$pole_tipy += "Tip 12: Hromada veci jak program pracuje byla jiz popsana ve vezi 6.2 pro Linux"
$pole_tipy += "Tip 13: Tato verze programu pro Windows vznikla hlavne z duvodu noveho grafickeho rozhrani a je velmi podobna verzi 6.2 pro Linux"
$pole_tipy += "Tip 14: Tato verze programu jiz nepouziva zadavani nazvu adresaru ale pracuje z jiz predem vytorenymi a obsahem naplnenymy adresary"
$pole_tipy += "Tip 15: Do adresare odkud byl spusten tento soubor vytvorte novy adresar, naplte ho vsim potrebnym a spuste program zasifruj.com"
$pole_tipy += "Tip 16: Do adresare odkud byl spusten tento soubor presunte sifrovany archiv napr. z prilohy email a spuste program desifruj.com"
$pole_tipy += "Tip 17: Takto zlute se pri kazdem spusteni programu bude zobrazovat nahodny tip ktery vam pomuze z pouzivanim programu"
$pole_tipy += "Tip 18: Zalohujte si slozku klicu tzn. adresar keys, prekopirovanim treba a flashdisk, vypalenim na cd-cko apod."
$pole_tipy += "Tip 19: Pokud chcete nektery adresar zazipovat 2x ale pomoci dvou ruznych klicu prejmenujte nejprve prvne vytvoreny archiv zip"
$pole_tipy += "Tip 20: Adresar ktery byl ji zazipovan a vznikl zneho soubor nazev_adrsare.zip, nebude jiz pri dalsim spusteni programu nabyzen znovu ne zpracovani"
$pole_tipy += "Tip 21: Paklize existuje napr. nazev slozky Adresar a znej vytvoreny archviv Adresar.zip, tak bude program pri dalsim spusteni obe polozky ignorovat"
$pole_tipy += "Tip 22: Paklize existuje napr. nazev archvivu Adresar.zip a znej je extrahovan adresar stejneho nazvu tzn Adresar, tak bude program pri dalsim spusteni obe polozky ignorovat"
$pole_tipy += "Tip 23: Nazvy souboru zip, adresaru (z vyjimkou adresare keys) a nazvy klicu dle libosti prejmenovavete, presouvejte a mazte"
$pole_tipy += "Tip 24: Soubory klicu urcenych pro starsi linuxovou verzi 6.2 nelze pouzit, tato verze pouziva jiny format klice"
$pole_tipy += 'Tip 25: paklize se program jak se rika "hryzne" pouzijte klavesou zkratku control+c'
$pole_tipy += "Tip 26: v pruzkumnikovy ve windows v adresari stimto programem mackejte klavesu F5 pro refresh"
$pole_tipy += "Tip 27: s cim si program opravdu neporadi to je diakritika, hotovy archiv si ale uz muzete pojmenovat jak chcete"
$pole_tipy += "Tip 28: Miximalni delka nazvu adresare je omezena na znaku na 69 znaku"
$pole_tipy += "Tip 28: Miximalni delka nazvu adresare je omezena na znaku na 69 znaku"
$pole_tipy += "Tip 29: Nazvy adrtesaru delsich nez 69 znaku bude program ignorovat az do doby jejich upravy, zkracenim jejich delky"
$pole_tipy += "Tip 29: Nazvy adrtesaru delsich nez 69 znaku bude program ignorovat az do doby jejich upravy, zkracenim jejich delky"
$pole_tipy += "Tip 30: jestlize by jste po havarii programu nasli nejaky soubor podivneho nazvu napr. seyubndlope.bat apod. tak ho vymazte"
$pole_tipy += "Tip 30: v menu CheckBoxu se da pohybovat take pomoci klaves tabulator,sipky,mezernik (select/deselect) a Enter misto tlacitka [OK]"
#
$d_pole_tipy = $pole_tipy.Length
#echo $d_pole_tipy
#for ($x=0 ;$x -le $d_pole_tipy; $x++){ Write-host -ForegroundColor yellow $pole_tipy[$x] } # kontola
$tip_rnd = Get-Random -Minimum 0 -Maximum $d_pole_tipy
#echo $tip_rnd
echo ""
Write-host -ForegroundColor yellow $pole_tipy[$tip_rnd]

sleep 20


