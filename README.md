This is an integration interface for manageing Users and Groups in Swyx/Netphone from Active Directory.<br/>
Its written in 100% in Powershell.<br/>
There are some things that still have to be done by hand, but it should take care of the most common things.<br/>

Features:<br/>
-User creation (Name, Internal number, External number, email)<br/>
-User info updating<br/>
-User enable and disable (based on ad account state)<br/>
-Writing back formatted phone numbers back to ad.<br/>
-Group Managment<br/>

Stuff i think is missing:<br/>
-Multi-Language for notifications (They are currently in german)<br/>
-Make AdminProfileManagment available via AD like current Group Managment (Set-AdNetphonePermissionGroups.ps1 is currently not used and disabled via return at start)<br/>

Stuff i probably wont do (If somebody else feels up to the task, hit me up on discord):<br/>
-Make number formating customizable (bcs no, i wont go into that hell hole again)<br/>
