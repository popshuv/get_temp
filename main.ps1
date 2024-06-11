function Get-Temperature {
    $t = Get-CimInstance MSAcpi_ThermalZoneTemperature -Namespace "root/wmi"
    $returntemp = @()

    foreach ($temp in $t.CurrentTemperature) {


        $currentTempKelvin = $temp / 10
        $currentTempCelsius = $currentTempKelvin - 273.15

        $returntemp += $currentTempCelsius.ToString() + " C : " + $currentTempKelvin + "K"  
    }
    return $returntemp
}

Get-Temperature