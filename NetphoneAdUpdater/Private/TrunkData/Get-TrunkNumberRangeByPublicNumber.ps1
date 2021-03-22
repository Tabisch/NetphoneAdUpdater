function Get-TrunkNumberRangeByPublicNumber
{
    Param(
    [parameter(Mandatory)]
    $PublicNumber
    )
    
    $TrunkRanges = Get-IpPbxTrunkNumberRange

    foreach($TrunkRange in $TrunkRanges)
    {
        for($counter = $TrunkRange.TailNumberStart -as [int] ; $counter -le $TrunkRange.TailNumberEnd -as [int]; $counter++)
        {
            $TrunkNumber = "+" + $TrunkRange.CountryCode + $TrunkRange.AreaCode + $TrunkRange.HeadNumber + $counter

            if($PublicNumber -eq $TrunkNumber)
            {
                return $TrunkRange
            }
        }
    }

    <#
    .SYNOPSIS
    Get the NumberRange the provided publicnumber is contained in

    .DESCRIPTION
    Get the NumberRange the provided publicnumber is contained in.

    .PARAMETER PublicNumber
    Has to be of type string

#>
}