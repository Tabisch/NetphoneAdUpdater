function Disable-NetphoneUsers
{
    foreach($User in Find-MissingAdUsers)
    {
        Disable-NetphoneUser -NetphoneUser $User
    }

    foreach($User in Get-AdNetphoneUsers)
    {
        $AdUser = (Get-ADUser -Identity $User)
        if($AdUser.Enabled -eq $false)
        {
            Disable-NetphoneUser -NetphoneUser (Get-NetphoneUserFromAdUser -AdUser $AdUser)
        }
    }
}