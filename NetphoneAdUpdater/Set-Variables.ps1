#Tell the Module, if it should run in debug mode (in production you dont need it, so please leave it alone)
New-Variable -Name debug -Value $false -Scope global -Force

#Tells powershell where this module is
New-Variable -Name NetphoneUpdaterFolder -Value $PSScriptRoot -Scope global

#Prefix to designate call distribution groups
New-Variable -Name NetphoneCallDistributionGroupsPrefix -Value "L_TelephoneServer_CallDistributionGroup_" -Scope global
#Designates the group of users users which should be active, but not part of any call distribution group (ie standlone users)
New-Variable -Name NetphoneUsersWithoutAdditionalGroupsGroup -Value "L_TelephoneServer_Users-Without-AdditionalGroups" -Scope global
#Designates the OU the call distriution groups and the NetphoneUsersWithoutAdditionalGroupsGroup reside in
New-Variable -Name GroupSearchBase -Value "OU=,OU=,OU=,DC=,DC=" -Scope global

#Sets the Call Distribution Type, if not specified otherwise in function call
New-Variable -Name GroupCallDistributionType -Value "Parallel" -Scope global
#Sets if Mobile Extention Managment Devices should be getting calls from call distribution groups
New-Variable -Name GroupCallDistributeToMEMDevices -Value $true -Scope global

#form mail address
New-Variable -Name MailFrom -Value "mailfrom@foobar.com" -Scope global
#to mail address
New-Variable -Name MailTo -Value "mailto@foobar.com" -Scope global
#mailserver
New-Variable -Name MailServer -Value "mailserver.foobar.com" -Scope global

#Prefix for Adminprofile groups (not implementet yet)
New-Variable -Name AdminProfilePrefix -Value "L_TelephoneServer_Administrationprofile_" -Scope global
#OU for Adminprofile groups (not implementet yet)
New-Variable -Name AdminProfileSearchBase -Value "OU=,OU=,OU=,DC=,DC=" -Scope global
#Default LocationID of Location-Resolve fails

New-Variable -Name DefaultLocationID -Value 1 -Scope global
#The provided Pattern always has to take 5 vaules (pattern is used in function Get-FormatedNumberForAdUser)
New-Variable -Name NumberFormatingPattern -Value "{0}{1} ({2}) {3} {4}" -Scope global
#lowest posible number to assign automaticlly
New-Variable -Name FirstAvaiableInternalNumber -Value 200 -Scope global

#Force Contact Creation for every NetphoneUser with a MobilephoneNumber
New-Variable -Name AddAllNetphoneUsersMobileNumber -Value $false -Scope global
#Group for Contact Creation with a AdUsers MobilephoneNumber
New-Variable -Name MobilephoneNumberCreationGroup -Value "L_TelephoneServer_MobilephoneNumberCreationGroup" -Scope global
#Mobilenumber Suffix
New-Variable -Name MobilephoneNumberSuffix -Value " (mobile)" -Scope global

#Disable AdNumberUpdate based on a Group
New-Variable -Name DisableAdNumberUpdateGroup -Value "L_TelephoneServer_DisableAdNumberUpdateGroup" -Scope global