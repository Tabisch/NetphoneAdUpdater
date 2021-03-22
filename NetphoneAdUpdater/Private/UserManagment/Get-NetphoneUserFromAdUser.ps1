function Get-NetphoneUserFromAdUser
{
    Param(
	[parameter(Mandatory)]
    $AdUser
    )
    
    foreach($NetphoneUser in (Get-IpPbxGroupMember -GroupName (Get-IpPbxEveryoneGroup).Name))
    {
        if(Match-Sid -AdUser $AdUser -NetphoneUser $NetphoneUser)
        {
            return $NetphoneUser
        }
    }
    
    Create-NewNetphoneUser -AdUser $AdUser

    return (Get-NetphoneUserFromAdUser -User $AdUser)

    <#
    .SYNOPSIS
    Return the a NetphoneUser for given AdUser, if not existant, create and return a new one.

    .DESCRIPTION
    Return the a NetphoneUser for given AdUser, if not existant, create and return a new one.

    .PARAMETER AdUser
    Has to be of type AdUser

    #>
}