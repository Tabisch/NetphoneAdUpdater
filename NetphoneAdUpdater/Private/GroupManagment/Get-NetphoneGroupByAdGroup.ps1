function Get-NetphoneGroupByAdGroup
{
    param(
    [parameter(Mandatory)]
    $AdGroup
    )

    return Get-IpPbxGroup -GroupName (Strip-AdGroupPrefix -AdGroup $AdGroup)

    <#
        .SYNOPSIS
        Returns the NetphoneGroup matched to the AdGroup specified

        .DESCRIPTION
        Searches and returns the NetphoneGroup matched to the specified AdGroup.
        The search is done by Stripping of the the AdGroup Prefix.

	    .PARAMETER AdGroup
        Has to be of type of AdGroup

    #>
}