function Get-NetphoneUsers
{
	return Get-IpPbxGroupMember -GroupName $(Get-IpPbxEveryoneGroup).Name

    <#
    .SYNOPSIS
    Returns all NetphoneUsers from the everyone group

    .DESCRIPTION
    Returns all NetphoneUsers from the everyone group.

    #>
}