function Set-NetphoneUserFaxForwarding
{
    Param(
        [parameter(Mandatory)]
        $NetphoneUser
    )

    #only execute if the NetphoneUser has Fax number
    if(Get-NetphoneNumber -NetphoneUser $NetphoneUser -IsFax)
    {
        #Get the AdUser which is assigned to the NetphoneUser
        $AdUser = Get-AdUserFromNetphoneUser -NetphoneUser $NetphoneUser

        #Declare a list of fax forwardings, which should be removed
        $InvalidFaxForwardings = @()
        #declare a variable which triggers the addition of the default fax forwarding (primary email-address)
        $DefaultExists = $false

        #check if any of the default fax forward exists
        foreach($FaxForwarding in (Get-IpPbxFaxForwarding -UserEntry $NetphoneUser))
        {
            if(($FaxForwarding.Type -eq 1) -and ($FaxForwarding.Data -eq "PDF") -and ($FaxForwarding.Address -and $AdUser.EmailAddress))
            {
                $DefaultExists = $true
            }
        }

        #if the default fax forward does not exist, add it
        if(!$DefaultExists)
        {
            New-IpPbxFaxForwarding -ForwardingType EMail -Address $AdUser.EmailAddress -DataType Pdf | Add-IpPbxFaxForwarding -UserEntry $NetphoneUser
        }

        #every entry, that is not desired is added to the list of entries to be removed
        foreach($FaxForwarding in (Get-IpPbxFaxForwarding -UserEntry $NetphoneUser))
        {
            if(!(($FaxForwarding.Type -ne 1) -or ($FaxForwarding.Data -eq "PDF") -or ($FaxForwarding.Address -and $AdUser.EmailAddress)))
            {
                $InvalidFaxForwardings += $FaxForwarding
            }
        }

        #reload all user data, bcs of the new faxforwarding (dont know if this even needed anymore, think it removed the new faxforwarding when update-ippbxuser is called)
        $NetphoneUser = Get-IpPbxUser -UserId $NetphoneUser.UserID

        foreach($InvalidFaxForwarding in $InvalidFaxForwardings)
        {
            #remove the entries that are not desired
            #has to be done this way, bcs remove-faxforwarding doesnt allow the removal of the forward to the fax client
            $NetphoneUser.FaxForwardingEntryCollection.Remove($InvalidFaxForwarding)
        }

        #push the updates to the user
        Update-IpPbxUser -UserEntry $NetphoneUser
    }

    <#
    .SYNOPSIS
    Forces all fax to be forwarded to the users primay email address as PDF

    .DESCRIPTION
    All forwards except forward to the primary email address as PDF are removed.
    If the forward to the primary email address as PDF is not set, it will be added.
    If the user doesnt have a fax number, nothing happens.

    .PARAMETER NetphoneUser
    Has to be of type IppbxUser

#>
}