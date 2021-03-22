function Set-AdUserNetphoneGroupMembership
{
    foreach($AdGroup in Get-AdNetphoneGroups)
    {
        if(!(Get-NetphoneGroupByAdGroup -AdGroup $AdGroup))
        {
            Create-NewNetphoneGroup -AdGroup $AdGroup
        }

        Set-NetphoneGroupMembership -AdGroup $AdGroup
    }
}