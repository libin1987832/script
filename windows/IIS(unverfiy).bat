@echo off
echo �������IIS���ܣ��������Ҫ������ʱ��...
start /w pkgmgr /iu:IIS-WebServerRole;IIS-WebServer;IIS-CommonHttpFeatures;IIS-StaticContent;IIS-DefaultDocument;IIS-DirectoryBrowsing;IIS-HttpErrors;IIS-HttpRedirect;IIS-ApplicationDevelopment;IIS-ASPNET;IIS-NetFxExtensibility;IIS-ASP;IIS-ISAPIExtensions;IIS-ISAPIFilter;IIS-ServerSideIncludes;IIS-HealthAndDiagnostics;IIS-HttpLogging;IIS-LoggingLibraries;IIS-RequestMonitor;IIS-HttpTracing;IIS-CustomLogging;IIS-ODBCLogging;IIS-Security;IIS-BasicAuthentication;IIS-WindowsAuthentication;IIS-DigestAuthentication;IIS-ClientCertificateMappingAuthentication;IIS-IISCertificateMappingAuthentication;IIS-URLAuthorization;IIS-RequestFiltering;IIS-IPSecurity;IIS-Performance;IIS-WebServerManagementTools;IIS-ManagementConsole;IIS-ManagementScriptingTools;IIS-ManagementService;IIS-IIS6ManagementCompatibility;IIS-Metabase;IIS-WMICompatibility;IIS-LegacyScripts;IIS-LegacySnapIn;WAS-WindowsActivationService;WAS-ProcessModel;WAS-NetFxEnvironment;WAS-ConfigurationAPI
echo IIS����ӳɹ�!
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


cd /d C:\Inetpub\AdminScripts //����ű�Ŀ¼
adsutil.vbs create_vserv latex //�½�վ��
adsutil.vbs set latex/serversize 1 //վ��Ĵ�С
adsutil.vbs set latex/servercomment "latex" //վ��ı���
adsutil.vbs set latex/serverbindings ":27939:" //վ��Ķ˿�
adsutil.vbs set latex/enabledefaultdoc true //����Ĭ���ĵ�
adsutil.vbs set latex/defaultdoc " " //Ĭ���ĵ�
rem adsutil.vbs create_vdir latex/ //������Ŀ¼
adsutil.vbs set latex/path E:\git\pdf-storage //��վ·��
adsutil.vbs set latex/accessread true //������վ���ԣ��ɶ�
adsutil.vbs set latex/accessscript true //����ִ��Ȩ��Ϊ�����ű�
adsutil.vbs appcreateinproc latex/ //����Ӧ�ó���
rem adsutil.vbs set latex/ Ĭ��Ӧ�ó���
rem adsutil.vbs CREATE W3SVC/AppPools/ETM_Pool "IIsApplicationPool" //����Ӧ�ó�
adsutil.vbs set latex/apppoolid ETM_Pool //ָ��Ӧ�ó�
cd /d C:\WINDOWS\Microsoft.NET\Framework\v4.0.30128 //ָ��.net�汾
aspnet_regiis /norestart -s /latex
