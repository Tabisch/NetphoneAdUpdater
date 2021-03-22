function Enable-NetphoneUsers
{
    Param(
    [switch]$SkipAdCheck
    )

    if($SkipAdCheck)
    {
        foreach($User in Get-IpPbxUser)
        {
            Enable-NetphoneUser -NetphoneUser $User
        }
    }
    else
    {
        foreach($User in Get-AdNetphoneUsers)
        {
            $AdUser = (Get-ADUser -Identity $User)
            if($AdUser.Enabled -eq $true)
            {
                Enable-NetphoneUser -NetphoneUser (Get-NetphoneUserFromAdUser -AdUser $AdUser)
            }
        }
    }
}