function Get-AdNetphoneUsersWithoutGroup
{
    return Get-ADGroupMember -Identity (Get-ADGroup -Filter "name -like '$($NetphoneUsersWithoutAdditionalGroupsGroup)'" -SearchBase $GroupSearchBase) -Recursive

    <#
    .SYNOPSIS
    Returns a list of ADGroupMembers which should be keeped active disspite no being part of an call distribution group

    .DESCRIPTION
    Returns a list of ADGroupMembers which should be keeped active disspite no being part of an call distribution group.
    Users should only be in this group, if they are not part of any call distribution group.
    #>
}