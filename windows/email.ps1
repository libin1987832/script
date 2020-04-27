chcp 65001
$ScheduledTaskName = "git rs"
#schtasks /query /FO LIST /V /TN $ScheduledTaskName  
$Result = (schtasks /query /FO LIST /V /TN $ScheduledTaskName  | findstr "Result")
#echo findstr "Last Result"
$Result = $Result.substring(12)
$Code = $Result.trim()
echo $Code
#If ($Code -gt 0) {
    $User = "15873465158@139.com"
    $Pass = ConvertTo-SecureString -String "Libin198783" -AsPlainText -Force
    $Cred = New-Object System.Management.Automation.PSCredential $User, $Pass
################################################################################

$From = "Alert Scheduled Task <15873465158@139.com>"
$To = "Me Gmail <15873465158@139.com>"
$Subject = "Scheduled task 'git' failed[home error:$Code]"
$Body = (Get-Content C:\Users\lb\Desktop\cmd\git.log -Tail 100) | Out-String
$SMTPServer = "smtp.139.com"
$SMTPPort = "25"

Send-MailMessage -From $From -to $To -Subject $Subject `
-Body $Body -SmtpServer $SMTPServer -port $SMTPPort -UseSsl `
-Credential $Cred
#}