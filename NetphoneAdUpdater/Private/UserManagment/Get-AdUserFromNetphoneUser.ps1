function Get-AdUserFromNetphoneUser
{
    Param(
    [parameter(Mandatory)]
    $NetphoneUser,
    $NetphoneGroup
    )

    foreach($netphoneaccountobject in $NetphoneUser.UserNTAccountEntryCollection)
    {
        try
        {
            #test if the user exists in the current ad
            $AdUser = Get-ADUser -Identity $netphoneaccountobject.NTAccount -Properties *
            
            if($NetphoneGroup)
            {
                return (Search-UserInAdMemberlist -AdGroupMembers (Get-ADGroupMember -Identity (Get-AdGroupFromNetphoneGroup -NetphoneGroup $NetphoneGroup)) -AdUser $AdUser)
            }
            else
            {
                return (Search-UserInAdMemberlist -AdGroupMembers (Get-AdNetphoneUsers) -AdUser $AdUser)
            }
        }
        catch
        {
        }
    }

    <#
    .SYNOPSIS
    Return the an AdUser for given NetphoneUser

    .DESCRIPTION
    Return the an AdUser for a given NetphoneUser.
    If a group is specified, the user will only be searched in the call distribution group.

    .PARAMETER AdUser
    Has to be of type AdUser

    .PARAMETER NetphoneGroup
    Has to be of type IppbxGroup
    #>
}