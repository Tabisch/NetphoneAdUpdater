function Find-MissingNetphoneGroups
{
    #Defining an array of Groups, that are flagged as Missing in the NetphoneServer
    $MissingGroups = @()
    #Get all NetphoneGroups (groups are fetched once to save performance)
    $NetphoneGroups = Get-IpPbxGroup

    #Loop through all AdGroups from Get-AdNetphoneGroups
    ForEach($Group in Get-AdNetphoneGroups)
    {
        #Reset GroupFound 
        $GroupFound = $false
        
        #Loop through all prefetched Netphone-Groups
        foreach($NetphoneGroup in $NetphoneGroups)
        {
            #If the AdGroup without the prefix matches the NetphoneGroup GroupFound is set to true, so the AdGroup does not get added to the MissingGroups array later
            if((Strip-AdGroupPrefix -AdGroup $Group) -eq $NetphoneGroup.Name)
            {
                $GroupFound = $true
                break
            }
        }

        #Add the AdGroup to the MissingGroups array if it isnt match to a existing Netphone-Group
        if($GroupFound -eq $false)
        {
            $MissingGroups += $Group
        }
    }

    return $MissingGroups

    <#
        .SYNOPSIS
        Returns all AdGroups, that are not matched to a NethponeGroup.

        .DESCRIPTION
        Returns all AdGroups, that are not matched to a NethponeGroup.
        AdGroups are fetched with function Get-AdNetphoneGroups.
        If the AdGroup cannot be matched with an existing NetphoneGroup, the AdGroup will be added to an array and which will be returned.
    #>
}