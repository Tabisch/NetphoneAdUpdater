function Get-AdUserToAddMobilNumberToGlobalPhonebook
{
    #get all Users of the form the group MobilephoneNumberCreationGroup and add them to the list of users to process
    $UsersToProcess = @()
    $UsersToProcess += Get-ADGroupMember -Identity (Get-ADGroup -Filter "name -eq `"$($MobilephoneNumberCreationGroup)`"" -SearchBase $GroupSearchBase) -Recursive

    #if GetAllAdNetphoneUsers is true, add der mobilephone numbers of all users with active NetphoneUsers
    if($AddAllNetphoneUsersMobileNumber)
    {
        $UsersToProcess += Get-AdNetphoneUsers
    }

    return $UsersToProcess | select -Unique

    <#
    .SYNOPSIS
    Gets all AdGroupMembers for which to create and update PhonebookEntries

    .DESCRIPTION
    Gets all AdGroupMembers for which to create and update PhonebookEntries.
    If $AddAllNetphoneUsersMobileNumber is set, also get all

    #>
}