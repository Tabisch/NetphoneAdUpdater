function Get-LocationByAdUser
{
    Param(
    [parameter(Mandatory)]
    $AdUser
    )

    return Get-IpPbxLocation -LocationName (Get-ADUser -Identity $AdUser -Properties "l").l

    <#
        .SYNOPSIS
        Gets the matching IppbxLocation to AdUser Location

        .DESCRIPTION
        Gets the matching IppbxLocation to AdUser Location

	    .PARAMETER AdUser
        Has to be of type AdUser

    #>
}