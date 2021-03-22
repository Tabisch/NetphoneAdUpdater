function Create-NetphoneGroups
{
    foreach($Group in Find-MissingNetphoneGroups)
    {
        Create-NewNetphoneGroup -AdGroup $Group
    }
}