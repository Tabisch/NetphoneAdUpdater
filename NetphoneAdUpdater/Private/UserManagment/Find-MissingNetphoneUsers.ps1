function Find-MissingNetphoneUsers
{
    Param(
    $AdGroup
    )

    #Fetch AdUsers from a specific group if provided otherwise fetch all
    if($AdGroup)
    {
        $AdUsers = Get-NetphoneGroupByAdGroup -AdGroup $AdGroup
    }
    else
    {
        $AdUsers = Get-AdNetphoneUsers
    }

    $MissingNetphoneUsers = @()

    #test for each AdUser if a matching NetphoneUser exists
	foreach($AdUser in $AdUsers)
	{
        $UserFound = $false

        foreach($NetphoneUser in Get-NetphoneUsers)
        {
            if(Match-Sid -NetphoneUser $NetphoneUser -AdUser $AdUser)
            {
                $UserFound = $true
                break
            }
        }

        if($UserFound -eq $false)
        {
              $MissingNetphoneUsers += $AdUser
        }
    }

    return $MissingNetphoneUsers

    <#
    .SYNOPSIS
    Returns all AdUser, which dont have a NetphoneUser assigned.

    .DESCRIPTION
    Returns all AdUser, which dont have a NetphoneUser assigned.
    This function can be run on a per call distribution group base.

    .PARAMETER AdGroup
    Has to be of type AdGroup
    If not provided the test is run on all call distribution groups
    

#>
}