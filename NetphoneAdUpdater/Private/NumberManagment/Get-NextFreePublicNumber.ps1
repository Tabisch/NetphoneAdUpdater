function Get-NextFreePublicNumber
{
    Param(
    $LocationID
    )

    if(!($LocationID) -or !(Get-IpPbxLocation -LocationId $LocationID))
    {
        $LocationID = $DefaultLocationID
    }

    #Get all Numbers available assigned to a location
    $TrunkRanges = Get-TrunkNumberRangesByLocation -LocationID $LocationID

    #Step through all Numberranges 
    foreach($TrunkRange in $TrunkRanges)
    {
        #Step through all tailnumber available in the number range
        for($counter = $TrunkRange.TailNumberStart -as [int] ; $counter -le $TrunkRange.TailNumberEnd -as [int]; $counter++)
        {
            #construct a public number to test
            $TrunkNumber = "+" + $TrunkRange.CountryCode + $TrunkRange.AreaCode + $TrunkRange.HeadNumber + $counter


            #test if that number is already assigned, if no return
            if(!(Get-IpPbxPublicNumber -PublicNumber $TrunkNumber))
            {
                return $TrunkNumber
            }
        }
    }

    <#
    .SYNOPSIS
    Gets the next free avaiable number form a trunk assigned to a location

    .DESCRIPTION
    Gets the next free avaiable number form a trunk assigned to the specified location.
    If LocationID is empty or invaild the function will default to $DefaultLocationID, set in Set-Variables.

    .PARAMETER LocationID
    Has to be of type int

    #>
}