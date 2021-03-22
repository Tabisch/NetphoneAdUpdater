function Update-NetphoneUsers
{
    ForEach($User in Get-IpPbxUser)
    {
       Update-NetphoneUser -NetphoneUser $User
    }
}