cls
# vytvori adresar podle datumu a casu
#$datum = "{0:dd_MM_yyyy-HH_mm_ss}" -f (Get-Date)
#$sulfix = ""
$sulfix = "-ZdePrejmenujtePodleSebe"
$datum = "{0:dd-MM-yyyy-HH-mm-ss}" -f (Get-Date)
echo "byl vytoren novy adresar z nazvem : $datum$sulfix"
#echo $datum
$null = New-Item -Path $datum$sulfix -ItemType Directory -Force
sleep 5
