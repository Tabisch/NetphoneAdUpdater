function Sync-NetphoneWithAd
{
    Connect-IpPbx

    Write-Host Creating missing NetphoneUsers
    Create-AdNetphoneUsers

    Write-Host Updating data in NetphoneUsers
    Update-NetphoneUsers

    Write-Host Updating data in AdUsers
    Update-AdPhoneNumbers

    Write-Host Creating missing NetphoneGroups
    Create-NetphoneGroups

    Write-Host Adjusting NetphoneGroupMemberships
    Set-AdUserNetphoneGroupMembership

    Write-Host Disabling NetphoneUsers
    Enable-NetphoneUsers

    Write-Host Enabling NetphoneUsers
    Disable-NetphoneUsers

    Write-Host Updating MobilePhoneNumbers in GlobalPhonebook
    Update-MobilephoneNumbersInGlobalPhonebook

    Disconnect-IpPbx
}