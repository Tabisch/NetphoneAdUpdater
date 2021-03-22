function Get-AdNetphoneUsers
{
    $Netphoneusers = @()

    #get all Members of the call distribution groups in Active Directory and add them to the list of users, that should have a NetphoneUser
    foreach($Group in Get-AdNetphoneGroups)
    {
        $Netphoneusers += Get-ADGroupMember -Identity $Group -Recursive
    }

    #Add all Members which are not part of a  call distribution groups, but should have an account
    $Netphoneusers += Get-AdNetphoneUsersWithoutGroup

    #filter out duplicates (part of multiple call distribution groups)
    $Netphoneusers = $Netphoneusers | select -Unique

    return $Netphoneusers

    <#
    .SYNOPSIS
    Get a list of AdGroupMembers, which should be active NetphoneUsers

    .DESCRIPTION
    Get a list of AdGroupMembers, which should be active NetphoneUsers
    #>
}