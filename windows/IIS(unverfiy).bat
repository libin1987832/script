@echo off
echo ÕýÔÚÌí¼ÓIIS¹¦ÄÜ£¬Õâ¿ÉÄÜÐèÒª¼¸·ÖÖÓÊ±¼ä...
start /w pkgmgr /iu:IIS-WebServerRole;IIS-WebServer;IIS-CommonHttpFeatures;IIS-StaticContent;IIS-DefaultDocument;IIS-DirectoryBrowsing;IIS-HttpErrors;IIS-HttpRedirect;IIS-ApplicationDevelopment;IIS-ASPNET;IIS-NetFxExtensibility;IIS-ASP;IIS-ISAPIExtensions;IIS-ISAPIFilter;IIS-ServerSideIncludes;IIS-HealthAndDiagnostics;IIS-HttpLogging;IIS-LoggingLibraries;IIS-RequestMonitor;IIS-HttpTracing;IIS-CustomLogging;IIS-ODBCLogging;IIS-Security;IIS-BasicAuthentication;IIS-WindowsAuthentication;IIS-DigestAuthentication;IIS-ClientCertificateMappingAuthentication;IIS-IISCertificateMappingAuthentication;IIS-URLAuthorization;IIS-RequestFiltering;IIS-IPSecurity;IIS-Performance;IIS-WebServerManagementTools;IIS-ManagementConsole;IIS-ManagementScriptingTools;IIS-ManagementService;IIS-IIS6ManagementCompatibility;IIS-Metabase;IIS-WMICompatibility;IIS-LegacyScripts;IIS-LegacySnapIn;WAS-WindowsActivationService;WAS-ProcessModel;WAS-NetFxEnvironment;WAS-ConfigurationAPI
echo IISÒÑÌí¼Ó³É¹¦!
pause

@set "sitePath=%~dp0"
 
@echo 新建程序池
@C:\Windows\System32\inetsrv\appcmd.exe add apppool /name:"新程序池" /managedRuntimeVersion:"v4.0"
@C:\Windows\System32\inetsrv\appcmd.exe stop site "Default Web Site"
@C:\Windows\System32\inetsrv\appcmd.exe add site /name:"新站点" /bindings:http/*:80: /applicationDefaults.applicationPool:"新程序池" /physicalPath:%sitePath%
 
Pause

dism /online /enable-feature /featurename:IIS-WebServerRole
dism /online /enable-feature /featurename:IIS-WebServer
dism /online /enable-feature /featurename:IIS-ISAPIExtensions
dism /online /enable-feature /featurename:IIS-ASP
dism /online /enable-feature /featurename:IIS-ServerSideIncludes
dism /online /enable-feature /featurename:IIS-HttpRedirect
dism /online /enable-feature /featurename:IIS-WebDAV
dism /online /enable-feature /featurename:IIS-IIS6ManagementCompatibility
dism /online /enable-feature /featurename:IIS-Metabase


cd /d C:\Inetpub\AdminScripts //½øÈë½Å±¾Ä¿Â¼
adsutil.vbs create_vserv latex //ÐÂ½¨Õ¾µã
adsutil.vbs set latex/serversize 1 //Õ¾µãµÄ´óÐ¡
adsutil.vbs set latex/servercomment "latex" //Õ¾µãµÄ±ðÃû
adsutil.vbs set latex/serverbindings ":27939:" //Õ¾µãµÄ¶Ë¿Ú
adsutil.vbs set latex/enabledefaultdoc true //ÆôÓÃÄ¬ÈÏÎÄµµ
adsutil.vbs set latex/defaultdoc " " //Ä¬ÈÏÎÄµµ
rem adsutil.vbs create_vdir latex/ //´´½¨¸ùÄ¿Â¼
adsutil.vbs set latex/path E:\git\pdf-storage //ÍøÕ¾Â·¾¶
adsutil.vbs set latex/accessread true //ÉèÖÃÍøÕ¾ÊôÐÔ£º¿É¶Á
adsutil.vbs set latex/accessscript true //ÉèÖÃÖ´ÐÐÈ¨ÏÞÎª£º´¿½Å±¾
adsutil.vbs appcreateinproc latex/ //´´½¨Ó¦ÓÃ³ÌÐò
rem adsutil.vbs set latex/ Ä¬ÈÏÓ¦ÓÃ³ÌÐò
rem adsutil.vbs CREATE W3SVC/AppPools/ETM_Pool "IIsApplicationPool" //´´½¨Ó¦ÓÃ³Ø
adsutil.vbs set latex/apppoolid ETM_Pool //Ö¸¶¨Ó¦ÓÃ³Ø
cd /d C:\WINDOWS\Microsoft.NET\Framework\v4.0.30128 //Ö¸¶¨.net°æ±¾
aspnet_regiis /norestart -s /latex
