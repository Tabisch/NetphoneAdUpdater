function Get-MobilenumberNameInGlobalPhonebook
{
    Param(
    [parameter(Mandatory)]
    $AdUser
    )

    return "$($AdUser.Name)$($MobilephoneNumberSuffix)"

    <#
    .SYNOPSIS
    Returns the mobilenumber suffix appended to the AdUsers Name

    .DESCRIPTION
    The function takes the provided AdUsers Name and appends the MobilephoneNumberSuffix(Set-Variables.ps1) to it.

    .PARAMETER AdUser
    Has to be an AdUser.

    #>
}