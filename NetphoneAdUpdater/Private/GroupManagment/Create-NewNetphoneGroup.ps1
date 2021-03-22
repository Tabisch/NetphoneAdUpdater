function Create-NewNetphoneGroup
{
    Param(
    [parameter(Mandatory)]
    $AdGroup,
    $CallDistributionType,
    $DistributeToMEMDevices
    )

    if(!($CallDistributionType))
    {
        $CallDistributionType = $GroupCallDistributionType
    }

    if(!($DistributeToMEMDevices))
    {
        $DistributeToMEMDevices = $GroupCallDistributeToMEMDevices
    }

    switch($CallDistributionType)
    {
        "Parallel" { New-IpPbxGroup -GroupName (Strip-AdGroupPrefix -AdGroup $AdGroup) -GroupCallingType DeliveryType_Parallel -AllowMemCalls $DistributeToMEMDevices | Add-IpPbxGroup -Passthru }
        "Sequential" { New-IpPbxGroup -GroupName (Strip-AdGroupPrefix -AdGroup $AdGroup) -GroupCallingType DeliveryType_SequentialFromTop -AllowMemCalls $DistributeToMEMDevices | Add-IpPbxGroup -Passthru }
        "Rotary" { New-IpPbxGroup -GroupName (Strip-AdGroupPrefix -AdGroup $AdGroup) -GroupCallingType DeliveryType_RoundRobin -AllowMemCalls $DistributeToMEMDevices | Add-IpPbxGroup -Passthru }
        "Random" { New-IpPbxGroup -GroupName (Strip-AdGroupPrefix -AdGroup $AdGroup) -GroupCallingType DeliveryType_Random -AllowMemCalls $DistributeToMEMDevices | Add-IpPbxGroup -Passthru }
    }

    
    <#
        .SYNOPSIS
        Add a NetphoneGroup matching to the specified AdGroup

        .DESCRIPTION
        Creates NetphoneGroup a matching to the specified AdGroup with its prefix stripped of.
        GroupCallDistributionType and GroupCallDistributeToMEMDevices is set in Set-Variables.
        The values of these groups are set once and never updated.
        Numbers for the Groups have to be set manually.

	    .PARAMETER AdGroup
        Has to be of type of AdGroup

        .PARAMETER CallDistributionType
        Overwrites GroupCallDistributionType.

        .PARAMETER DistributeToMEMDevices
        Overwrites GroupCallDistributeToMEMDevices

    #>
}