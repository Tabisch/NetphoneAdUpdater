function Set-HiddenStateInEntryInGlobalPhonebook
{
    Param(
    [parameter(Mandatory)]
    $AdUser
    )

    $PhonebookEntry = Get-IpPbxPhonebookEntry -GlobalPhoneBook -SearchName (Get-MobilenumberNameInGlobalPhonebook -AdUser $AdUser)

    #stop if no PhonebookEntry is found
    if(!($PhonebookEntry))
    {
        return
    }

    $ShouldBeHidden = $false

    #Decide if the Number should behidden
    if($AdUser.Enabled -eq $true)
    {
        $ShouldBeHidden = $true
    }

    if($PhonebookEntry.Hide -eq $true)
    {
        if(!($ShouldBeHidden))
        {
            $PhonebookEntry.Hide = $false
            Update-IpPbxPhonebookEntry -PhonebookEntry $PhonebookEntry
        }
    }
    else
    {
        if($ShouldBeHidden)
        {
            $PhonebookEntry.Hide = $false
            Update-IpPbxPhonebookEntry -PhonebookEntry $PhonebookEntry
        }
    }

    <#
    .SYNOPSIS
    Changes the hidden state of the GlobalPhonebookEntry based on the activation state of the AdUser

    .DESCRIPTION
    Changes the hidden state of the GlobalPhonebookEntry based on the activation state of the AdUser.
    If the state already matches the desired state, nothing is done.

    .PARAMETER AdUser
    Has to be an AdUser.

    #>
}