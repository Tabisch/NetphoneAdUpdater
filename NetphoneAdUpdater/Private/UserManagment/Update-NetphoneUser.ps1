function Update-NetphoneUser
{
    Param(
    [parameter(Mandatory)]
    $NetphoneUser
    )

    #get the AdUser matched to the provided NetphoneUser
    $AdUser = Get-AdUserFromNetphoneUser -NetphoneUser $NetphoneUser

    #if no User can be found exit
    if(!$AdUser)
    {
        return
    }

    #Set NetphoneUser values to AdUser values
    $NetphoneUser.Name = $AdUser.Name
    $NetphoneUser.Comment = $AdUser.Description
    $NetphoneUser.LocationID = (Get-LocationByAdUser -AdUser $AdUser).LocationId
    
    Update-IpPbxUser -UserEntry $NetphoneUser

    #Set the primary email-address as email-adress
    Set-IpPbxUserEmailAddress -UserEntry $NetphoneUser -EmailAddress $AdUser.mail

    #Set Fax Forwarding behavior
    Set-NetphoneUserFaxForwarding -NetphoneUser $NetphoneUser

    <#
    .SYNOPSIS
    Write AdUser valuse to NetphoneUser

    .DESCRIPTION
    Update Name, Comment and location.
    Set the primary email address as email address.
    Set the desired fax forwarding bahavior. 

    .PARAMETER NetphoneUser
    Has to be of type IppbxUser

    #>
}