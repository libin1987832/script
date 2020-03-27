@echo off
echo 正在添加IIS功能，这可能需要几分钟时间...
start /w pkgmgr /iu:IIS-WebServerRole;IIS-WebServer;IIS-CommonHttpFeatures;IIS-StaticContent;IIS-DefaultDocument;IIS-DirectoryBrowsing;IIS-HttpErrors;IIS-HttpRedirect;IIS-ApplicationDevelopment;IIS-ASPNET;IIS-NetFxExtensibility;IIS-ASP;IIS-ISAPIExtensions;IIS-ISAPIFilter;IIS-ServerSideIncludes;IIS-HealthAndDiagnostics;IIS-HttpLogging;IIS-LoggingLibraries;IIS-RequestMonitor;IIS-HttpTracing;IIS-CustomLogging;IIS-ODBCLogging;IIS-Security;IIS-BasicAuthentication;IIS-WindowsAuthentication;IIS-DigestAuthentication;IIS-ClientCertificateMappingAuthentication;IIS-IISCertificateMappingAuthentication;IIS-URLAuthorization;IIS-RequestFiltering;IIS-IPSecurity;IIS-Performance;IIS-WebServerManagementTools;IIS-ManagementConsole;IIS-ManagementScriptingTools;IIS-ManagementService;IIS-IIS6ManagementCompatibility;IIS-Metabase;IIS-WMICompatibility;IIS-LegacyScripts;IIS-LegacySnapIn;WAS-WindowsActivationService;WAS-ProcessModel;WAS-NetFxEnvironment;WAS-ConfigurationAPI
echo IIS已添加成功!
pause


dism /online /enable-feature /featurename:IIS-WebServerRole
dism /online /enable-feature /featurename:IIS-WebServer
dism /online /enable-feature /featurename:IIS-ISAPIExtensions
dism /online /enable-feature /featurename:IIS-ASP
dism /online /enable-feature /featurename:IIS-ServerSideIncludes
dism /online /enable-feature /featurename:IIS-HttpRedirect
dism /online /enable-feature /featurename:IIS-WebDAV
dism /online /enable-feature /featurename:IIS-IIS6ManagementCompatibility
dism /online /enable-feature /featurename:IIS-Metabase


cd /d C:\Inetpub\AdminScripts //进入脚本目录
adsutil.vbs create_vserv latex //新建站点
adsutil.vbs set latex/serversize 1 //站点的大小
adsutil.vbs set latex/servercomment "latex" //站点的别名
adsutil.vbs set latex/serverbindings ":27939:" //站点的端口
adsutil.vbs set latex/enabledefaultdoc true //启用默认文档
adsutil.vbs set latex/defaultdoc " " //默认文档
rem adsutil.vbs create_vdir latex/ //创建根目录
adsutil.vbs set latex/path E:\git\pdf-storage //网站路径
adsutil.vbs set latex/accessread true //设置网站属性：可读
adsutil.vbs set latex/accessscript true //设置执行权限为：纯脚本
adsutil.vbs appcreateinproc latex/ //创建应用程序
rem adsutil.vbs set latex/ 默认应用程序
rem adsutil.vbs CREATE W3SVC/AppPools/ETM_Pool "IIsApplicationPool" //创建应用池
adsutil.vbs set latex/apppoolid ETM_Pool //指定应用池
cd /d C:\WINDOWS\Microsoft.NET\Framework\v4.0.30128 //指定.net版本
aspnet_regiis /norestart -s /latex
