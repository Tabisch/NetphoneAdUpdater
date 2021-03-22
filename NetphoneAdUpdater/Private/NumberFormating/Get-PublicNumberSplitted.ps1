function Get-PublicNumberSplitted
{
    Param(
    [parameter(Mandatory)]
    $PublicNumber
    )

    if(!(Get-IpPbxPublicNumber -PublicNumber $PublicNumber))
    {
        return
    }
    
    $TrunkRanges = Get-IpPbxTrunkNumberRange

    foreach($TrunkRange in $TrunkRanges)
    {
        for($counter = $TrunkRange.TailNumberStart -as [int] ; $counter -le $TrunkRange.TailNumberEnd -as [int]; $counter++)
        {
            $TrunkNumber = "+" + $TrunkRange.CountryCode + $TrunkRange.AreaCode + $TrunkRange.HeadNumber + $counter

            if($PublicNumber -eq $TrunkNumber)
            {
                return @("+",$TrunkRange.CountryCode,$TrunkRange.AreaCode,$TrunkRange.HeadNumber,$counter)
            }
        }
    }

    <#
        .SYNOPSIS
        Returns the public number splitt in +, CountryCode, AreaCode, HeadNumber and the Tailnumber

        .DESCRIPTION
        Returns the public number splitt in +, CountryCode, AreaCode, HeadNumber and the Tailnumber.
        If the the public number provided public number is invaild, the function returns nothing.

	    .PARAMETER PublicNumber
        Has to be of type string

    #>
}