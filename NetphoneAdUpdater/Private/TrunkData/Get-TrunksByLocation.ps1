function Get-TrunksByLocation
{
    Param(
    [parameter(Mandatory)]
    $LocationID
    )

    return (Get-TrunkGroupsByLocation -LocationID $LocationID).PortEntryCollection

    <#
    .SYNOPSIS
    Returns all Trunks by Location

    .DESCRIPTION
    Returns all Trunks by Location

    .PARAMETER LocationID
    Has to be of type int

#>
}