function Get-FormatedNumberForAdUser
{
    Param(
    [parameter(Mandatory)]
    $NetphoneUser,
    [Switch]$IsFax
    )

    $InternalNumber = ""

    if($IsFax)
    {
        $InternalNumber = Get-NetphoneNumber -NetphoneUser $NetphoneUser -IsFax
    }
    else
    {
        $InternalNumber = Get-NetphoneNumber -NetphoneUser $NetphoneUser
    }

    if($InternalNumber -eq $null)
    {
        return ""
    }

    $NumberParts = Get-PublicNumberSplitted -PublicNumber (Get-IpPbxPublicNumber -InternalNumber $InternalNumber).Number

    if($NumberParts)
    {
        return $NumberFormatingPattern -f $NumberParts[0],$NumberParts[1],$NumberParts[2],$NumberParts[3],$NumberParts[4]
    }
    else
    {
        return ""
    }

    <#
        .SYNOPSIS
        Returns part of the Trunknumber, thats similar in all numbers of the trunk

        .DESCRIPTION
        Returns part of the Trunknumber, thats similar in all numbers of the trunk.
        If fetching the parts for number formating fails, the function returns an empty string.

	    .PARAMETER NetphoneUser
        Has to be of type ippbxuser

    #>
}