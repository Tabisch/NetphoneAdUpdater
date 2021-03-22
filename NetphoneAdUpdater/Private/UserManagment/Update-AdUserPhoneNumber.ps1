function Update-AdUserPhoneNumber
{
    Param(
    [parameter(Mandatory)]
    $AdUser
    )

    #fetch AdUser with ipphone property
    $Aduser = Get-ADUser -Identity $AdUser -Properties ipPhone
    $NetphoneUser = Get-NetphoneUserFromAdUser -AdUser $AdUser

    if((Get-AdUsersWithDisabledTelephoneUpdates).name -contains $AdUser.name)
    {
        return
    }

    #if the AdUser is found
    if($Aduser)
    {
        #if number if fax update the fax number, else write the number into the ipphone field
        If((Get-FormatedNumberForAdUser -NetphoneUser $NetphoneUser -IsFax))
        {
            Set-ADUser -Identity $Aduser -OfficePhone (Get-FormatedNumberForAdUser -NetphoneUser $NetphoneUser) -Fax (Get-FormatedNumberForAdUser -NetphoneUser $NetphoneUser -IsFax) -Replace @{ipPhone = (Get-NetphoneNumber -NetphoneUser $NetphoneUser)}
        }
        else
        {
            Set-ADUser -Identity $Aduser -OfficePhone (Get-FormatedNumberForAdUser -NetphoneUser $NetphoneUser) -Replace @{'ipPhone' = (Get-NetphoneNumber -NetphoneUser $NetphoneUser)}
        }
    }

    <#
    .SYNOPSIS
    Update the fax and/or phone number

    .DESCRIPTION
    Update the fax and/or phone number.
    If a fax number exists both are updated.

    .PARAMETER AdUser
    Has to be of type AdUser

#>
}