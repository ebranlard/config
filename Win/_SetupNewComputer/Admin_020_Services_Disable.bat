@echo off
echo Disabling selected non-essential Windows services...
echo.


sc stop "EventLog"

echo Adobe update service
sc stop "AdobeARMservice"
sc config "AdobeARMservice" start= disabled


echo ==== Capability Access Manager Service
sc stop "camsvc"
sc config "camsvc" start= auto

:: Disable Diagnostic Policy Service (troubleshooting features)
echo ===== Service: DPS (Diagnostic Policy Service)
sc config DPS start= disabled
sc stop DPS

:: Disable WAP Push Message Routing (telemetry)
echo ===== Service: dmwappushservice (WAP Push Telemetry)
sc config dmwappushservice start= disabled
sc stop dmwappushservice

echo ==== Microsoft Office Click-to-Run Service
sc stop "ClickToRunSvc"
sc config "ClickToRunSvc" start= demand

:: Disable Telemetry (Connected User Experiences and Telemetry)
echo ==== Windows Telemetry (Data Collection)
sc stop "DiagTrack"
sc config "DiagTrack" start= disabled

echo ==== Data Usage Service
sc stop "DUSMSvc"
sc config "DUSMSvc" start= disabled


echo ==== Fax service (used for sending/receiving faxes)
sc stop "Fax"
sc config "Fax" start= disabled



echo ==== Microsoft Store Install Service
sc stop "InstallService"
sc config "InstallService" start= demand

echo ==== Downloaded Maps Manager (for offline maps)
sc stop "MapsBroker"
sc config "MapsBroker" start= disabled

:: Disable Program Compatibility Assistant
echo ===== Service: PcaSvc (Program Compatibility Assistant)
sc config PcaSvc start= disabled
sc stop PcaSvc

echo ==== Phone Service
sc stop "PhoneSvc"
sc config "PhoneSvc" start= disabled


echo ==== Remote Access Connection Manager (VPN/Dial-up)
sc stop "RasMan"
sc config "RasMan" start= demand

echo ==== Remote Registry access (security risk if not needed)
sc stop "RemoteRegistry"
sc config "RemoteRegistry" start= disabled

echo ==== Retail Demo service (used in demo units in stores)
sc stop "RetailDemo"
sc config "RetailDemo" start= disabled

echo ==== Print Spooler (only if no printers used)
sc stop "Spooler"
sc config "Spooler" start= demand

echo ==== Tenable Nessus Agent Service
sc stop "Tenable Nessus Agent"
sc config "Tenable Nessus Agent" start= disabled

:: Disable Windows Biometric Service (e.g., Windows Hello)
echo ===== Service: WbioSrvc (Biometric Service)
sc config WbioSrvc start= disabled
sc stop WbioSrvc

:: Disable Windows Error Reporting Service
echo ===== Service: WERSVC (Error Reporting)
sc config WERSVC start= disabled
sc stop WERSVC

echo ==== Windows Push Notifications System Service
sc stop "WpnService"
sc config "WpnService" start= disabled
sc stop "WpnUserService_95fc56c"
sc config "WpnUserService_95fc56c" start= disabled

:: Disable Windows Search (Indexing — can reduce disk activity)
::sc stop "WSearch"
::sc config "WSearch" start= disabled

echo ==== Windows collector service
sc stop "Wecsvc"
sc config "Wecsvc" start= disabled

echo ==== Windows Media Player Network Sharing Service
sc stop "WMPNetworkSvc"
sc config "WMPNetworkSvc" start= disabled

echo ==== Xbox Live Game Save service (used for syncing Xbox games)
sc stop "XblGameSave"
sc config "XblGameSave" start= disabled

echo ==== Xbox Accessory Management Service
sc stop "XboxGipSvc"
sc config "XboxGipSvc" start= disabled

echo ==== Xbox Networking Service
sc stop "XboxNetApiSvc"
sc config "XboxNetApiSvc" start= disabled


::echo Disable Optimize Drives (can be disabled if using 3rd-party tools)
::sc stop "OptSvc"
::sc config "OptSvc" start= disabled

 
::sc config "Schedule" start= disabled   :: Windows Event Log
::sc config "UsoSvc"   start= disabled   :: Update Orchestrator Service
::::sc config "EventLog" start= disabled :: Task Scheduler





echo.
echo Done. Some services may require a reboot for changes to take effect.
pause
