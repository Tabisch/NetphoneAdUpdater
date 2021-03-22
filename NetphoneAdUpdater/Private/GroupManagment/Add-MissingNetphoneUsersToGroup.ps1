function Add-MissingNetphoneUsersToGroup
{
    Param(
    [parameter(Mandatory)]
    $NetphoneGroup
    )

    #Gets all AdUsers from AdGroup matched to specified NetphoneGroup
    foreach($User in Get-ADGroupMember -Identity (Get-AdGroupFromNetphoneGroup -NetphoneGroup $NetphoneGroup))
    {
        #if user is also in the adgroup, that specifies, that all NetphoneUser which should be active but shouldnt be in any other NetphoneGroup a notification is send
        if((Get-AdNetphoneUsersWithoutGroup) -contains $User)
        {
            Send-NetphoneInformation -Subject "Nephone-Gruppenbereinigung für Benutzer $($User.Name) im AD benötigt" -Body "$($User.Name) ist in Gruppen User_ohne_Gruppe und $($NetphoneGroup.Name). `r `n Bitte Benutzergruppenmitgliedschaft bereinigen."
        }

        #Add the NetphoneUser to NetphoneGroup and ignor all errors
        Add-IpPbxGroupMember -GroupEntry $NetphoneGroup -UserEntry (Get-NetphoneUserFromAdUser -AdUser $User) -ErrorAction SilentlyContinue
    }

    <#
        .SYNOPSIS
        Adds NetphoneUsers to NetphoneGroups

        .DESCRIPTION
        Adds NetphoneUsers matched to AdUser to NetphoneGroups, if the Aduser is contained in the AdGroup matched to the NetphoneGroup.
        If the AdUser is also in the Group specified in the Variable UsersWithoutAddionalGroups a notification is send.

	    .PARAMETER Name

    #>
}