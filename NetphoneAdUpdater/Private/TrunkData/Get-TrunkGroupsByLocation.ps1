function Get-TrunkGroupsByLocation
{
    Param(
    [parameter(Mandatory)]
    $LocationID
    )

    $TrunkGroups = @()

    foreach($TrunkGroup in Get-IpPbxTrunkGroup)
    {
        if($TrunkGroup.LocationID -eq $LocationID)
        {
            $TrunkGroups += $TrunkGroup
        }
    }

    return $TrunkGroups

    <#
    .SYNOPSIS
    Returns all Trunkgroups from provided location

    .DESCRIPTION
    Returns all Trunkgroups from provided location.

    .PARAMETER LocationID
    Has to be of type int

    #>
}