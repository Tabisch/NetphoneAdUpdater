function Send-NetphoneInformation
{
    Param(
    [parameter(Mandatory)]
    $Subject,
    $Body
    )

    if(!($Body))
    {
     $Body = ""
    }
    
    Send-MailMessage -To $MailTo -From $MailFrom -Subject $Subject -Body $Body -SmtpServer $MailServer -UseSsl
    
    <#
        .SYNOPSIS
        Sends an unauthenticated notification Mail to the email server

        .DESCRIPTION
        Sends an unauthenticated notification Mail to the email server
        MailTo, MailFrom and MailServer have to be set in Set-Variables.ps1

	    .PARAMETER Subject
        The Subject of the mail.

        .PARAMETER Body
        The body of the mail.
        If not set, it will be empty.

    #>
}