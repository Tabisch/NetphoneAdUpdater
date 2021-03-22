function Get-AdGroupFromNetphoneGroup
{
    Param(
    [parameter(Mandatory)]
    $NetphoneGroup
    )

    #Return the found AdGroup
    return Get-ADGroup -Filter "name -like '$($NetphoneCallDistributionGroupsPrefix)$($NetphoneGroup.Name)'" -SearchBase $GroupSearchBase

    <#
        .SYNOPSIS
        Returns the AdGroup which is matched to the NetphoneGroup

        .DESCRIPTION
        Returns the AdGroup which is matched to the NetphoneGroup.
        The AdGroup has to be in the right OU and has to have the Name Prefix + NetphoneGroupName
        SearchBase and Prefix are defined in the Set-Varibales.ps1 script.
    #>
}