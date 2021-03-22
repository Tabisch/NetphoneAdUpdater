function Enable-NetphoneUser
{
    Param(
    [parameter(Mandatory)]
    $NetphoneUser
    )

    #For some reason they decided, that they that to invert the locked state, so it says enabled on the management interface.
    #Don't ask me why, i didn't design it that way.
    $NetphoneUser.Locked = $false

    foreach($InternalNumber in $NetphoneUser.InternalNumberEntryCollection)
    {
        $InternalNumber.Hide = $false
        $InternalNumber.ApplyData($InternalNumber)
    }
    
    Update-IpPbxUser -UserEntry $NetphoneUser

    <#
    .SYNOPSIS
    Reenables a NetphoneUser and unhides them from the telephone list

    .DESCRIPTION
    Set the locked state to false.
    Unhides all Entries of that NetphoneUser from the telephone list.

    .PARAMETER NetphoneUser
    Has to be of type IppbxUser

#>
}