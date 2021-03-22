function Strip-AdGroupPrefix
{
    Param(
    [parameter(Mandatory)]
    $AdGroup,
    $Prefix
    )

    if(!($Prefix))
    {
        $Prefix = $NetphoneCallDistributionGroupsPrefix
    }


    return $AdGroup.name.Substring($Prefix.length)

    <#
        .SYNOPSIS
        Strips away the the GroupPrefix

        .DESCRIPTION
        Strips away the the GroupPrefix.
        If not specified NetphoneRufverteilerPrefix will be used.

	    .PARAMETER AdGroup
        Must be of type AdGroup
        
        .PARAMETER Prefix
        Prefix to strip away               

    #>
}