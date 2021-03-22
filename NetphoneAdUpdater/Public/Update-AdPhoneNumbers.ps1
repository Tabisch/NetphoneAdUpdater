function Update-AdPhoneNumbers
{
    foreach($User in Get-AdNetPhoneUsers)
    {
        Update-AdUserPhoneNumber -AdUser $User
    }
}