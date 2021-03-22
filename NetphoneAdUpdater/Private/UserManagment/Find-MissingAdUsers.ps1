function Find-MissingAdUsers
{
    #get a list of all AdUsers, which should have a active NetphoneUser
    $AdUsers = Get-AdNetphoneUsers
    #Define an array for AdUsers which currently dont have an NetphoneUser
    $MissingAdUsers = @()

    #Test for every NetphoneUser if there is a matching AdUser in the current Domain
	foreach($NetphoneUser in Get-NetphoneUsers)
	{
        #reseting, if a match has been found
        $UserFound = $false

        #test every AdUser, if it matched any SID of the current NetphoneUsers being tested
        foreach($AdUser in $AdUsers)
        {
            if(Match-Sid -NetphoneUser $NetphoneUser -AdUser $AdUser)
            {
                $UserFound = $true
                break
            }
        }

        #if no AdUser can be matched the current NetphoneUser added to the list of User missing an AdUser
        if($UserFound -eq $false)
        {
              $MissingAdUsers += $NetphoneUser
        }
    }

    return $MissingAdUsers

    <#
    .SYNOPSIS
    Returns a list of all non-System NetphoneUsers, which dont have an AdUSer in any relevant AdGroup

    .DESCRIPTION
    All AdUsers in Groups specified to be call distribution groups or in the UsersWithoutAdditionalGroups fetched.
    If a NetphoneUser cant be matched to any of the fechted AdUser it will be added to the list that is returned.
    #>
}