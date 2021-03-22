function Match-Sid
{
    Param(
	[parameter(Mandatory)]
    $NetphoneUser,
    [parameter(Mandatory)]
    $AdUser
    )

    #Check if any of the Accounts in UserNTAccountEntryCollection matches the current AdUser being tested
    foreach($netphoneaccountobject in $NetphoneUser.UserNTAccountEntryCollection)
    {
        if($netphoneaccountobject.NTAccount -eq $AdUser.Sid)
        {
            return $true
        }
    }

    return $false

    <#
    .SYNOPSIS
    Checks if any of the Sids in the NetphoneUserAdAccountCollection match the current AdUser

    .DESCRIPTION
    Checks if any of the Sids in the NetphoneUserAdAccountCollection match the current AdUser.
    Added because of an Ad-Migartion.

	.PARAMETER NetphoneUser
    Has to be of type IppbxUser 

    .PARAMETER AdUser
    Has to be of type AdUser
#>
}