function Search-UserInAdMemberlist
{
    Param(
    [parameter(Mandatory)]
    $AdGroupMembers,
    [parameter(Mandatory)]
    $AdUser
    )

    foreach($AdGroupMember in $AdGroupMembers)
    {
        if($AdUser.Sid -eq $AdGroupMember.Sid)
        {
            return $AdUser
        }
    }

    return $false

    <#
    .SYNOPSIS
    Checks if a user is part of a list of AdGroupMemebers

    .DESCRIPTION
    Checks if a user is part of a list of AdGroupMemebers.
    Returns true SIDs match, otherwise returns flase.

    .PARAMETER AdGroupMembers
    Has to be of type AdGroupMemebers

    .PARAMETER AdUser
    Has to be of type AdUser
#>
}