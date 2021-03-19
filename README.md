This is an integration interface for manageing Users and Groups in Swyx/Netphone from Active Directory.<br/>
There are some things that still have to be done by hand, but it should take care of the most common things.<br/>
Its written for Netphone/Swyx 12.31, bcs thats currently running where i work.<br/>
Standalone NetphoneUsers must have ServiceAccounts in Active Directory, otherwise they will be disabled (except SystemAccounts)<br/>
If anyone has some ideas how to improve the development, please tell me.<br/>
I really love the stuff i do here, but god do i hate working with build-in powershell ise.<br/>

Features:<br/>
-User creation (Name, Internal number, public number, email, location)<br/>
-User info updating<br/>
-User enable and disable (based on ad account state and group membership)<br/>
-Writing back formatted phone numbers back to ad.<br/>
-Group Managment (Usermembership and group creation (only AD->NetphoneServer))<br/>

Stuff i think is missing or should be changed:<br/>
-Multi-Language for notifications (They are currently in german)<br/>
-Make AdminProfileManagment available via AD like current Group Managment (Set-AdNetphonePermissionGroups.ps1 is currently not used and disabled via return at start)<br/>
-Set-NetphoneUserFaxForwarding could be optimised, but it will do for now<br/>
-Function names should be changed (Powershell is saying that some functions are non standard verbs. Its true, but it works)<br/>
-Froce object types (stuff just works right now and i didnt bother looking it up yet, so  ¯\_(ツ)_/¯)<br/>

Stuff i probably wont change (If somebody else feels up to the task, hit me up on discord):<br/>
-Make number formating more customizable (number formating always takes 5 values, bcs of data fetches)<br/>
-Fax Forwarding will be disabled. All fax the user receives are forwared to the users primary email address. (Fax client will not receive anymore)<br/>

P.S.
Please dont have multiple AdAccounts assigned to the same NetphoneUsers.<br/>
That stuff will probably end in my script writig stuff in to users you dont want it to.<br/>
