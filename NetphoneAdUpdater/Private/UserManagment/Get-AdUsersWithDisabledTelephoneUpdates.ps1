function Get-AdUsersWithDisabledTelephoneUpdates
{
    return Get-ADGroupMember -Identity (Get-ADGroup -Filter "name -eq `"$($DisableAdNumberUpdateGroup)`"" -SearchBase $GroupSearchBase) -Recursive

    <#
    .SYNOPSIS
    Gets a list AdGroupMembers for whom to disable telephonenumber updates

    .DESCRIPTION
    Gets a list AdGroupMembers for whom to disable telephonenumber updates

    #>
}