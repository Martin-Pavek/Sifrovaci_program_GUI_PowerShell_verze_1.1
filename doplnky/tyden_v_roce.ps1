cls
$ted = (get-date)
echo $ted

$den_v_roce = $ted.DayOfYear
echo "je $den_v_roce den v roce"

[int32] $tyden_v_roce = (( $den_v_roce / 7 ))
echo "cislo tydne je $tyden_v_roce"

sleep 10
