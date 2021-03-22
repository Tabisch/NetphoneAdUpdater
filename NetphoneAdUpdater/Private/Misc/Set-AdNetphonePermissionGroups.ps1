function Set-AdNetphonePermissionGroups
{
    return

    $Benutzer_Administrators = Get-ADGroupMember -Filter "name -like '$($AdminProfilePrefix)Benutzer-Administrator'" -SearchBase $AdminProfileSearchBase
    $Telefonbuch_Operators = Get-ADGroupMember -Filter "name -like '$($AdminProfilePrefix)Telefonbuch-Operator'" -SearchBase $AdminProfileSearchBase
    $System_Administrators = Get-ADGroupMember -Filter "name -like '$($AdminProfilePrefix)System-Administrator'" -SearchBase $AdminProfileSearchBase

    foreach($Benutzer_Administrator in $Benutzer_Administrators)
    {
        if(!($Telefonbuch_Operators -contains $Benutzer_Administrator))
        {
            if(!($System_Administrators -contains $Benutzer_Administrator))
            {
                $NetphoneUser = (Get-NetphoneUserFromAdUser -AdUser $Benutzer_Administrator)
                $NetphoneUser.AdminProfileID = 3
                $NetphoneUser.Update()
            }
        }
    }

    foreach($Telefonbuch_Operator in $Telefonbuch_Operators)
    {
        if(!($System_Administrators -contains $Telefonbuch_Operator))
        {
            (Get-NetphoneUserFromAdUser -AdUser $Benutzer_Administrator).AdminProfileID = 9
            $NetphoneUser = (Get-NetphoneUserFromAdUser -AdUser $Benutzer_Administrator)
                $NetphoneUser.AdminProfileID = 3
                $NetphoneUser.Update()
        }
    }

    foreach($System_Administrator in $System_Administrators)
    {
        (Get-NetphoneUserFromAdUser -AdUser $Benutzer_Administrator).AdminProfileID = 1
        $NetphoneUser = (Get-NetphoneUserFromAdUser -AdUser $Benutzer_Administrator)
        $NetphoneUser.AdminProfileID = 3
        $NetphoneUser.Update()
    }

    <#
    .SYNOPSIS
    Sets NetphoneUser AdminProfile (Currently Disabled)

    .DESCRIPTION
    Sets NetphoneUser AdminProfile on NethphoneServer.
    AdminProfilePrefix and AdminProfileSearchBase are set in Set-Variables.ps1.
    Developing this feature is currently low priority.

#>
}