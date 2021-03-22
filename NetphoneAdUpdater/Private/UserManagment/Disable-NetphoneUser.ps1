function Disable-NetphoneUser
{
    Param(
    [parameter(Mandatory)]
    $NetphoneUser
    )

    #For some reason they decided, that they that to invert the locked state, so it says enabled on the management interface.
    #Don't ask me why, i didn't design it that way.
    $NetphoneUser.Locked = $true

    foreach($InternalNumber in $NetphoneUser.InternalNumberEntryCollection)
    {
        $InternalNumber.Hide = $true
        $InternalNumber.ApplyData($InternalNumber)
    }
    
    Update-IpPbxUser -UserEntry $NetphoneUser

    <#
    .SYNOPSIS
    Disables a NetphoneUser and hide all telephone entries.

    .DESCRIPTION
    Disables a NetphoneUser and hide all telephone entries.

    .PARAMETER NetphoneUser
    Has to be of type NetphoneUser

    #>
}