function Get-PublicNumberTrunkFromUser
{
    Param(
    $NetphoneUser,
    $PublicNumber
    )
    
    if($NetphoneUser)
    {
        $PublicNumber = (Get-IpPbxPublicNumber -InternalNumber $NetphoneUser.InternalNumberEntryCollection.Number)[0]
    }

    if(!($PublicNumber))
    {
        return
    }

    return Get-IpPbxTrunk -TrunkId (Get-TrunkNumberRangeByPublicNumber -PublicNumber $PublicNumber).ParentEntry

    <#
    .SYNOPSIS
    Return the Trunk a public number is part of

    .DESCRIPTION
     Return the Trunk a public number is part of.
     If a NetphoneUser is provided, the function will always use the first number the NethphoneUser has.
     If no public number is found, nothing is returned.

    .PARAMETER NetphoneUser
    Has to be of type IppxUser

    .PARAMETER PublicNumber
    Has to be of type string

#>
}