function Update-EntryInGlobalPhonebook
{
    Param(
    [parameter(Mandatory)]
    $AdUser
    )

    $AdUser = Get-ADUser -Identity $AdUser -Properties Mobile
    $PhonebookEntry = Get-IpPbxPhonebookEntry -GlobalPhoneBook -SearchName (Get-MobilenumberNameInGlobalPhonebook -AdUser $AdUser)

    #stop if no PhonebookEntry is found
    if(!($PhonebookEntry) -or !($AdUser.Mobile))
    {
        return
    }

    #only execute if the number is different
    if(($AdUser.Mobile -ne $PhonebookEntry.Number))
    {
        $PhonebookEntry.Number = $AdUser.Mobile
        Update-IpPbxPhonebookEntry -PhonebookEntry $PhonebookEntry

    }

    <#
    .SYNOPSIS
    Changes the Number of a GlobalPhonebookEntry

    .DESCRIPTION
    If the Number PhonebookEntry in the  is different to the Mobilenumber of the AdUser the Number will be changed to the Mobilenumber.
    If the Mobilenumber has been emptied, the GlobalPhonebookEntry is removed.

    .PARAMETER AdUser
    Has to be an AdUser.

    #>
}