function Get-TrunkNumberRangesByLocation
{
    Param(
    [parameter(Mandatory)]
    $LocationID
    )

    return (Get-TrunksByLocation -LocationID $LocationID).PortNumberRangeEntryCollection

    <#
    .SYNOPSIS
    Returns all NumberRanges for a location

    .DESCRIPTION
    Returns all NumberRanges for a location.

    .PARAMETER LocationID
    Has to be of type int

#>
}