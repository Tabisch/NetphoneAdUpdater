This is an integration interface for manageing Users and Groups in Swyx/Netphone from Active Directory.<br/>
There are some things that still have to be done by hand, but it should take care of the most common things.<br/>
Its written for Netphone 12.31, bcs thats currently running where i work.<br/>
Should work for all Swyx Servers, because Netphone should only be a rebranded Swyx.<br/>
For transparncy i want to tell you, that i only tested it on the NetphoneServer we got from TeleCom.<br/>
The whole module is documented as well as i knew how to do it. (Im a sysadmin not a professional dev)<br/>

Features:<br/>
-User creation (Name, Internal number, public number, email, location)<br/>
-User info updating<br/>
-User enable and disable (based on ad account state and group membership)<br/>
-Writing back formatted phone numbers back to ad. (There is a function to disable this for specific users)<br/>
-Group Managment (Usermembership and group creation (only AD->NetphoneServer))<br/>
-Creating Contacts for Mobilephone numbers (Specific Users and Specific Users + all NetphoneUsers)<br/>

Stuff i think is missing or should be changed:<br/>
-Multi-Language for notifications (They are currently in german)<br/>
-Centralize notifications (They scattered around the script)<br/>
I dont have a list where they currently are.<br/>
-Make AdminProfileManagment available via AD like current Group Managment (Set-AdNetphonePermissionGroups.ps1 is currently not used and disabled via return at start)<br/>
-Set-NetphoneUserFaxForwarding performace could be optimised, but it will do for now<br/>
-Function names should be changed (Powershell is saying that some functions use non standard verbs. Its true, but it works for now)<br/>
Some function names are "optimizable", but i couldnt think of anything better yet.<br/>
-Change the folders functions are stored in (the folder doesnt matter, they work from anywhere as long they are somewhere under public or private)<br/>
-Force object types (get-help says what you need and the script uses the right ones everywhere, so it shouldnt be a problem)<br/>

Stuff i probably wont change (If somebody else feels up to the task, hit me up on discord):<br/>
-Make number formating more customizable (number formating always takes 5 values, bcs of data fetches)<br/>
-Customizeable Fax Forwarding. All fax the user receives are forwared to the users primary email address in PDF. (Fax client will not receive anymore)<br/>

Warnings:
-Be careful when configuring Set-Variables.ps1.<br/>
Always fill the Prefix and OU variables, otherwise you will have to delete alot of unwanted groups. (Talking from expirence)<br/>
-All Get-AdGroupMember calls are recursive, so be careful when adding groups.<br/>
-Please dont have multiple AdAccounts assigned to the same NetphoneUsers.<br/>
That stuff will probably end in my script writig stuff into wrong users. (Ad and TelephoneServer)<br/>
-Create all the groups listed in the How to part. I dont know what happens, if you dont and i really dont want to find out.<br/>

Prerequisites:<br/>
-Module "Ippbx" has to be imported automaticlly when opening a powershell session.<br/>

How to setup:<br/>
-Copy the module onto the Netphone/Swyx Server<br/>
-Configure "Set-Variables.ps1"<br/>
-Setup the CallDistributionGroups,Group for Users without CallDistributionGroups, Group for whom to disable telephonenumber and Group for users for which to create contact with their mobile number.<br/>
-Add Active Directory Accounts to all NetphoneUsers (except SystemAccounts), otherwise they will be disabled.<br/>
-Add your Users to the appropriatte groups.<br/>
-cd to the root of the module and run AutoSync.ps1.<br/>

P.S.
If anyone has some ideas how to improve the development, please tell me.<br/>
I really love the stuff i do here, but god do i hate working with build-in powershell ise.<br/>
