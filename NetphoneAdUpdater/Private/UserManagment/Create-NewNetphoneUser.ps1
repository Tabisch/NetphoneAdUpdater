function Create-NewNetphoneUser
{
    Param(
    [parameter(Mandatory)]
    $AdUser
    )

    #Force the parameter to be of type AdUser
    $AdUser = Get-ADUser -Identity $AdUser 

    #Get the location the new NetphoneUser should be created in
    $LocationId = (Get-LocationByAdUser -AdUser $AdUser).LocationId

    #if the location is not found, the account creation is aborted and a message send
    if(!$LocationId)
    {
        Send-NetphoneInformation -Subject "Anlage von Netphone-Benutzer $($AdUser.Name) ist abgebrochen worden." -Body "Anlage von Netphone-Benutzer $($AdUser.Name) ist aufgrund fehlerhafter Informationen im Ort-Feld (AD) abgebrochen worden"
        return
    }

    #Create a new NetphoneUser by importing their data from active directory (not all desired fields are filled here (See function Update-NetphoneUser))
    $AdUser | Import-IpPbxADUser -Confirm:$False

    #get the newly created NetphoneUser
    $NetphoneUser = Get-NetphoneUserFromAdUser -AdUser $AdUser
    #Update all user data
    Update-NetphoneUser -NetphoneUser $NetphoneUser

    #Set the next free internal number as the internal number
    $InternalNumber = Get-IpPbxNextFreeInternalNumber -BeginSearchFromNumber $FirstAvaiableInternalNumber
    New-IpPbxInternalNumber -InternalNumber $InternalNumber | Add-IpPbxInternalNumberToUser -UserEntry $NetphoneUser

    #set an public number which has the same ending as the internal number, if this fails get the next free number available (See function Get-NextFreePublicNumberLocationBased) (I know the name is not 100% spot on, but im not changing that until i have a better one)
    New-IpPbxPublicNumber -PublicNumber (Get-NextFreePublicNumberLocationBased -LocationID $LocationId  -InteralNumber $InternalNumber) | Add-IpPbxPublicNumber -InternalNumber $InternalNumber

    <#
    .SYNOPSIS
    Create a new NetphoneUser, call an update of user date, set internal number and public number

    .DESCRIPTION
    Create a new NetphoneUser, call an update of user date, set internal number and public number
    If the location in the Active Directory cannot be matched to a location of the NetphoneServer, the NetphoneUser creation will be aboreded.

    .PARAMETER AdUser
    Has to provide some data which can be used to execute Get-ADUser -Identity (https://docs.microsoft.com/en-us/powershell/module/addsadministration/get-aduser?view=windowsserver2019-ps)

#>
}