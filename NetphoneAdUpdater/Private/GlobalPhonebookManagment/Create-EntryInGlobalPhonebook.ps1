function Create-EntryInGlobalPhonebook
{
    Param(
    [parameter(Mandatory)]
    $AdUser
    )

    $AdUser = Get-ADUser -Identity $AdUser -Properties Mobile
    $EntryName = Get-MobilenumberNameInGlobalPhonebook -AdUser $AdUser

    if(!$AdUser.Mobile)
    {
        return
    }

    #If no phonebook entry exists and the User in the list is active, than create a new PhonebookEntry with a placeholder number
    if(!(Get-IpPbxPhonebookEntry -GlobalPhoneBook -SearchName $EntryName))
    {
            New-IpPbxPhonebookEntry -Name $EntryName -GlobalPhoneBook -IsHidden -Number $EntryName | Add-IpPbxPhoneBookEntry
    }

    <#
    .SYNOPSIS
    Creates an hidden PhonebookEnrty which only holds a Name

    .DESCRIPTION
    Creates an hidden PhonebookEnrty which only holds a Name.
    The Entry should be updated afterwards the be filled with a vaild Phonenumber and be unhidden.

    .PARAMETER Name
    Has to be of type AdUser.

    #>
}