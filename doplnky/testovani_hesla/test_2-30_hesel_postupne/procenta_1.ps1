cls

function procent ([int] $pocet_z_celku, [int] $celek) {
echo "pocet z celku = $pocet_z_celku"
echo "celek = $celek"
$procent = ($pocet_z_celku/$celek).ToString("P")
echo "to je $procent z celku "
echo ""
}

procent 4 126

procent ((4*2)) ((126*2))

procent 26 ((126*3))


