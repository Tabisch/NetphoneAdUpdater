function Remove-MissingNetphoneUsersFromGroup
{

    Param(
    [parameter(Mandatory)]
    $NetphoneGroup
    )

    #Get all NetphoneUsers contained in the specified Group
    $NetphoneGroupMembers = Get-IpPbxGroupMember -GroupEntry $NetphoneGroup

    #Lookup for each user in the Netphonegroup, if a matching user is found in the AdGroup responsible for NetphoneGroupMembership
    foreach($NetphoneGroupMember in $NetphoneGroupMembers)
    {
        #If the user is not contained in the AdGroup responsible for NetphoneGroupMembership, the user is removed from the NetphoneGroup
        if(!(Get-AdUserFromNetphoneUser -NetphoneUser $NetphoneGroupMember -NetphoneGroup $NetphoneGroup))
        {
            Remove-IpPbxGroupMember -GroupEntry $NetphoneGroup -UserEntry $NetphoneGroupMember -Confirm:$false
        }
    }

    <#
        .SYNOPSIS
        Removes all NetphoneUsers from the NetphoneGroup, who arent in the matching AdGroup

        .DESCRIPTION
        Removes all NetphoneUsers from the NetphoneGroup, who arent in the AdGroup responsible for NetphoneGroupMembership.

	    .PARAMETER NetphoneGroup
        Specifies the NetphoneGroup to manage.
        Parameter has to be of type IpPbxGroup
    #>
}