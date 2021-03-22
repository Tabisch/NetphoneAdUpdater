function Get-NetphoneNumber
{
    Param(
    [parameter(Mandatory)]
    $NetphoneUser,
    [Switch]$IsFax,
    [Switch]$IsPublicNumber
    )

    foreach($NumberEntry in $NetphoneUser.InternalNumberEntryCollection)
    {
        if($NumberEntry.IsFaxNumber -eq $IsFax)
        {
            if($IsPublicNumber)
            {
                if((Get-IpPbxPublicNumber -InternalNumber $NumberEntry.Number))
                {
                    return Get-IpPbxPublicNumber -InternalNumber $NumberEntry.Number
                }
            }
            else
            {
                return $NumberEntry.Number
            }
        }
    }

    return $null

    <#
    .SYNOPSIS
    Return the first number in NetphoneUser NumberCollection selected by provided parameters

    .DESCRIPTION
    Return the first number in NetphoneUser NumberCollection
    The number is selected by the provided parameters.
    If no fitting number is found $null is returned

    .PARAMETER IsFax
    Causes the function to return the first fax number.

    .PARAMETER IsPublicNumber
    Causes the function to return the publicnumber connected to an internal number.
    If the User only has internal numbers $null is returned.

#>
}