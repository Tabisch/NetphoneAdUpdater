function Get-AdNetphoneGroups
{
    return Get-ADGroup -Filter "name -like `"$($NetphoneCallDistributionGroupsPrefix)*`"" -SearchBase $GroupSearchBase

    <#
        .SYNOPSIS
        Returns all groups from an OU with a prefix.

        .DESCRIPTION
        Returns all groups from an OU with a prefix.
        SearchBase and Prefix are defined in the Set-Varibales.ps1 script.
    #>
}