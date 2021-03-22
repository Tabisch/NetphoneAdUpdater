function Set-NetphoneGroupMembership
{
    Param(
    [parameter(Mandatory)]
    $AdGroup
    )

    $NetphoneGroup = Get-NetphoneGroupByAdGroup -AdGroup $AdGroup

    Remove-MissingNetphoneUsersFromGroup -NetphoneGroup $NetphoneGroup
    Add-MissingNetphoneUsersToGroup -NetphoneGroup $NetphoneGroup

    <#
        .SYNOPSIS
        Calls functions for removing and adding NetphoneUsers from NetphoneGroups

        .DESCRIPTION
        Calls functions for removing and adding NetphoneUsers from NetphoneGroups
        Users are removed first and than added.

	    .PARAMETER AdGroup
        Must be and Object of type  AdGroup
    #>
}