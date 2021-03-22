function Get-AdUserFromGlobalphonebookEntry
{
    Param(
    [parameter(Mandatory)]
    $GlobalPhonebookEntry
    )

    return Get-ADUser -Filter "name -like '$($GlobalPhonebookEntry.name.substring(0,($PhonebookEntry.name.length - $MobilephoneNumberSuffix.length)))'"

    <#
    .SYNOPSIS
    Returns the AdUser matched to the GlobalPhonebookEntry

    .DESCRIPTION
    Returns the AdUser matched to the GlobalPhonebookEntry

    .PARAMETER GlobalPhonebookEntry
    Has to be of type GlobalPhonebookEntry.

    #>
}
