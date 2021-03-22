function Update-MobilephoneNumbersInGlobalPhonebook
{
    $UsersToProcess = Get-AdUserToAddMobilNumberToGlobalPhonebook

    foreach($User in $UsersToProcess)
    {
        Create-EntryInGlobalPhonebook -AdUser $User
        Update-EntryInGlobalPhonebook -AdUser $User
        Set-HiddenStateInEntryInGlobalPhonebook -AdUser $User
    }

    Remove-MobilephonenumbersFromGlobalPhonebook

    <#
    .SYNOPSIS
    Update all Mobilephone numbers of internal Users

    .DESCRIPTION
    Update all Mobilephone numbers of internal Users.
    User are selected by being in the $MobilephoneNumberCreationGroup und all NetphoneUsers, if the $AddAllNetphoneUsersMobileNumber

    #>
}