function Get-NextFreePublicNumberLocationBased
{
    Param(
    $LocationID,
    $InteralNumber
    )

    if(!($LocationID) -or !(Get-IpPbxLocation -LocationId $LocationID))
    {
        $LocationID = $DefaultLocationID
    }

    #Get all NumberRanges for all Locations
    $TrunkRanges = Get-TrunkNumberRangesByLocation -LocationID $LocationID

    #If $InteralNumber is set, try to get a public number with the same end as internal number from any numberrange
    if($InteralNumber)
    {
        foreach($TrunkRange in $TrunkRanges)
        {
            if(!(Get-IpPbxPublicNumber -PublicNumber  ("+" + $TrunkRange.CountryCode + $TrunkRange.AreaCode + $TrunkRange.HeadNumber + $InteralNumber)))
            {
                return ("+" + $TrunkRange.CountryCode + $TrunkRange.AreaCode + $TrunkRange.HeadNumber + $InteralNumber)
            }
        }
    }
    
    return Get-NextFreePublicNumber -LocationID $LocationID

    <#
    .SYNOPSIS
    Returns the next free public number

    .DESCRIPTION
    Returns the next free public number.
    If InteralNumber is specified, the function tries to return a free public number with the same end as the internal number.
    If no public number with the same end as the internal number can be found or InteralNumber is not specified, the function returns the next free number for in the first numberrange in that location.
    If LocationID is empty or invaild the function will default to $DefaultLocationID, set in Set-Variables.

    .PARAMETER LocationID
    Has to be of type int

    .PARAMETER InteralNumber
    Has to be of type int

    #>
}