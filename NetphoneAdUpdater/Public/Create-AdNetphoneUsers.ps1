function Create-AdNetphoneUsers
{
    ForEach($User in Find-MissingNetphoneUsers)
    {
       Create-NewNetphoneUser -AdUser $User
    }
}