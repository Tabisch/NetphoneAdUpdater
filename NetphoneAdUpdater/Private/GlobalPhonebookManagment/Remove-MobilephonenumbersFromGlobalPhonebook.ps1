function Remove-MobilephonenumbersFromGlobalPhonebook
{
    #get all entries in the global phonebook
    $PhonebookEntrys = Get-IpPbxPhonebookEntry -GlobalPhoneBook

    #step through all phonebook entries
    foreach($PhonebookEntry in $PhonebookEntrys)
    {
        $AdUser = Get-AdUserFromGlobalphonebookEntry -GlobalPhonebookEntry $PhonebookEntry

        #only execute if a AdUser is found
        if($AdUser)
        {
            #fetch group member and mobile number for the found number
            $AdUser = Get-ADUser -Identity $AdUser -Properties memberof,mobile
            
            #only execute if a mobile number is found or the user has been removed from all groups responsible for adding to the globalphonebook
            if(!($AdUser.mobile) -or (!(Get-AdUserToAddMobilNumberToGlobalPhonebook).name -contains $AdUser.name))
            {
                #remove the entry
                Remove-IpPbxPhoneBookEntry -PhoneBookEntry $PhonebookEntry -Confirm:$false
            }
        }
    }


    <#
    .SYNOPSIS
    Removes GlobalPhonebookEntries for specific AdUsers

    .DESCRIPTION
    Removes GlobalPhonebookEntries for AdUsers.
    Removal will happen if the users are removed from all groups used for contact creation or if the mobile number is removed.

    #>
}