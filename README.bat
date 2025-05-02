reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "UploadUserActivities" /t REG_DWORD /d 0 /f
de locatie:
reg add 
"HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /v "SensorPermissionState" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration" /v "Status" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\Maps" /v "AutoUpdateEnabled" /t REG_DWORD /d 0 /

notifications:
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v DisableNotificationCenter /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v ToastEnabled /t REG_DWORD /d 0 /f
echo Notifications disabled successfully.


Disabling StickyKeys...
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\StickyKeys" /v Flags /t REG_SZ /d 506 /f



Disabling Taskbar Widgets...
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarDa /t REG_DWORD /d 0 /f



Setting Display For Performance...
reg add "HKCU\Control Panel\Desktop" /v "DragFullWindows" /t REG_SZ /d "0" /f
reg add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "200" /f
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d "0" /f
reg add "HKCU\Control Panel\Keyboard" /v "KeyboardDelay" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewAlphaSelect" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewShadow" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d 3 /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "EnableAeroPeek" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarMn" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarDa" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d 0 /f
powershell -Command "Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name 'UserPreferencesMask' -Type Binary -Value ([byte[]](144,18,3,128,16,0,0,0))"

asta e pt Disabling GameDVR...
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehavior /t REG_DWORD /d 2 /f
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\System\GameConfigStore" /v GameDVR_DXGIHonorFSEWindowsCompatible /t REG_DWORD /d 1 /f
reg add "HKCU\System\GameConfigStore" /v GameDVR_HonorUserFSEBehaviorMode /t REG_DWORD /d 1 /f
reg add "HKCU\System\GameConfigStore" /v GameDVR_EFSEFeatureFlags /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v BingSearchEnabled /t REG_DWORD /d 0 /f


Enabling Hardware Accelerated GPU Scheduling...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d 2 /f

Disabling Transparency Effects...
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize /v EnableTransparency /t REG_DWORD /d 0 /f
 

pentru mouse accelerations:
Disabling Mouse Acceleration...
reg add "HKCU\Control Panel\Mouse" /v MouseSpeed /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold1 /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold2 /t REG_SZ /d 0 /f

pentru hibernation:
Disabling Hibernation...
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Power" /v HibernateEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" /v ShowHibernateOption /t REG_DWORD /d 0 /f
powercfg.exe /hibernate off

Disabling HomeGroup...
sc config HomeGroupListener start=demand >nul 2>&1
sc config HomeGroupProvider start=demand >nul 2>&1


Disabling Unnecessary WiFi Settings...
reg add "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" /v "Value" /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" /v "Value" /t REG_DWORD /d 0 /f


Disabling UAC...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /f /v EnableLUA /t REG_DWORD /d 0


Disabling Telemetry...
timeout 1 > nul
schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable >nul 2>&1 
schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable >nul 2>&1 
schtasks /Change /TN "Microsoft\Windows\Autochk\Proxy" /Disable >nul 2>&1 
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable >nul 2>&1 
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable >nul 2>&1 
schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable >nul 2>&1 
schtasks /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClient" /Disable >nul 2>&1 
schtasks /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" /Disable >nul 2>&1 
schtasks /Change /TN "Microsoft\Windows\Windows Error Reporting\QueueReporting" /Disable >nul 2>&1 
schtasks /Change /TN "Microsoft\Windows\Application Experience\MareBackup" /Disable >nul 2>&1 
schtasks /Change /TN "Microsoft\Windows\Application Experience\StartupAppTask" /Disable >nul 2>&1 
schtasks /Change /TN "Microsoft\Windows\Application Experience\PcaPatchDbTask" /Disable >nul 2>&1 
schtasks /Change /TN "Microsoft\Windows\Maps\MapsUpdateTask" /Disable >nul 2>&1 
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v ContentDeliveryAllowed /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v OemPreInstalledAppsEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v PreInstalledAppsEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v PreInstalledAppsEverEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SilentInstalledAppsEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338387Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338388Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338389Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-353698Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SystemPaneSuggestionsEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v DisableWindowsConsumerFeatures /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Siuf\Rules" /v NumberOfSIUFInPeriod /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v DoNotShowFeedbackNotifications /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v DisableTailoredExperiencesWithDiagnosticData /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v DisabledByGroupPolicy /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v Disabled /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v DODownloadMode /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v fAllowToGetHelp /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager" /v EnthusiastMode /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowTaskViewButton /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v PeopleBand /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v LaunchTo /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v LongPathsEnabled /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v SearchOrderConfig /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 4294967295 /f
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_DWORD /d 1 /f
reg add "HKCU\Control Panel\Desktop" /v AutoEndTasks /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v ClearPageFileAtShutdown /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\ControlSet001\Services\Ndu" /v Start /t REG_DWORD /d 2 /f
reg add "HKCU\Control Panel\Mouse" /v MouseHoverTime /t REG_SZ /d 400 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v IRPStackSize /t REG_DWORD /d 30 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" /v EnableFeeds /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Feeds" /v ShellFeedsTaskbarViewMode /t REG_DWORD /d 2 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v HideSCAMeetNow /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v Priority /t REG_DWORD /d 6 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d High /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement" /v "ScoobeSystemSettingEnabled" /t REG_DWORD /d 0 /f


Disabling Core isolation/Memory integrity
reg add "HKLM\System\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v Enabled /t REG_DWORD /d 0 /f >nul 2>&1 


Disable Unnecessary Services and Tasks
reg add "HKLM\System\CurrentControlSet\Services\PimIndexMaintenanceSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\WinHttpAutoProxySvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\BcastDVRUserService" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\xbgm" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AudioCaptureEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "CursorCaptureEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "MicrophoneCaptureEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d "2" /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d "2" /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\GameDVR" /v "AllowgameDVR" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d "0" /f
sc config wlidsvc start= disabled
sc config DisplayEnhancementService start= disabled
sc config DiagTrack start= disabled
sc config DusmSvc start= disabled
sc config TabletInputService start= disabled >nul 2>&1
sc config RetailDemo start= disabled
sc config Fax start= disabled >nul 2>&1
sc config SharedAccess start= disabled
sc config lfsvc start= disabled
sc config WpcMonSvc start= disabled
sc config SessionEnv start= disabled
sc config MicrosoftEdgeElevationService start= disabled
sc config edgeupdate start= disabled
sc config edgeupdatem start= disabled
sc config autotimesvc start= disabled
sc config CscService start= disabled >nul 2>&1
sc config TermService start= disabled
sc config SensorDataService start= disabled
sc config SensorService start= disabled
sc config SensrSvc start= disabled
sc config shpamsvc start= disabled
sc config diagnosticshub.standardcollector.service start= disabled
sc config PhoneSvc start= disabled
sc config TapiSrv start= disabled
sc config UevAgentService start= disabled >nul 2>&1
sc config WalletService start= disabled
sc config TokenBroker start= disabled
sc config WebClient start= disabled
sc config MixedRealityOpenXRSvc start= disabled >nul 2>&1
sc config stisvc start= disabled
sc config WbioSrvc start= disabled
sc config icssvc start= disabled
sc config Wecsvc start= disabled
sc config XboxGipSvc start= disabled
sc config XblAuthManager start= disabled
sc config XboxNetApiSvc start= disabled
sc config XblGameSave start= disabled
sc config SEMgrSvc start= disabled
sc config iphlpsvc start= disabled
sc config Backupper Service start= disabled >nul 2>&1
sc config BthAvctpSvc start= disabled
sc config BDESVC start= disabled >nul 2>&1
sc config cbdhsvc start= disabled
sc config CDPSvc start= disabled
sc config CDPUserSvc start= disabled
sc config DevQueryBroker start= disabled
sc config DevicesFlowUserSvc start= disabled
sc config dmwappushservice start= disabled
sc config DispBrokerDesktopSvc start= disabled
sc config TrkWks start= disabled
sc config dLauncherLoopback start= disabled >nul 2>&1
sc config EFS start= disabled
sc config fdPHost start= disabled
sc config FDResPub start= disabled
sc config IKEEXT start= disabled
sc config NPSMSvc start= disabled
sc config WPDBusEnum start= disabled
sc config PcaSvc start= disabled
sc config RasMan start= disabled
sc config RetailDemo start=disabled
sc config SstpSvc start=disabled
sc config ShellHWDetection start= disabled
sc config SSDPSRV start= disabled
sc config SysMain start= disabled
sc config OneSyncSvc start= disabled
sc config lmhosts start= disabled
sc config UserDataSvc start= disabled
sc config UnistoreSvc start= disabled
sc config Wcmsvc start= disabled
sc config FontCache start= disabled
sc config W32Time start= disabled
sc config tzautoupdate start= disabled
sc config DsSvc start= disabled
sc config DevicesFlowUserSvc_5f1ad start= disabled >nul 2>&1
sc config diagsvc start= disabled
sc config DialogBlockingService start= disabled >nul 2>&1
sc config PimIndexMaintenanceSvc_5f1ad start= disabled >nul 2>&1
sc config MessagingService_5f1ad start= disabled >nul 2>&1
sc config AppVClient start= disabled >nul 2>&1
sc config MsKeyboardFilter start= disabled >nul 2>&1
sc config NetTcpPortSharing start= disabled
sc config ssh-agent start= disabled
sc config SstpSvc start= disabled
sc config OneSyncSvc_5f1ad start= disabled >nul 2>&1
sc config wercplsupport start= disabled
sc config WMPNetworkSvc start= disabled >nul 2>&1
sc config WerSvc start= disabled
sc config WpnUserService_5f1ad start= disabled >nul 2>&1
sc config WinHttpAutoProxySvc start= disabled >nul 2>&1
schtasks /DELETE /TN "AMDInstallLauncher" /f >nul 2>&1
schtasks /DELETE /TN "AMDLinkUpdate" /f >nul 2>&1
schtasks /DELETE /TN "AMDRyzenMasterSDKTask" /f >nul 2>&1
schtasks /DELETE /TN "Driver Easy Scheduled Scan" /f >nul 2>&1
schtasks /DELETE /TN "ModifyLinkUpdate" /f >nul 2>&1
schtasks /DELETE /TN "SoftMakerUpdater" /f >nul 2>&1
schtasks /DELETE /TN "StartCN" /f >nul 2>&1
schtasks /DELETE /TN "StartDVR" /f >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Application Experience\PcaPatchDbTask" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Application Experience\StartupAppTask" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Autochk\Proxy" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Defrag\ScheduledDefrag" /Disable
schtasks /Change /TN "Microsoft\Windows\Device Information\Device" /Disable
schtasks /Change /TN "Microsoft\Windows\Device Information\Device User" /Disable
schtasks /Change /TN "Microsoft\Windows\Diagnosis\RecommendedTroubleshootingScanner" /Disable
schtasks /Change /TN "Microsoft\Windows\Diagnosis\Scheduled" /Disable
schtasks /Change /TN "Microsoft\Windows\DiskCleanup\SilentCleanup" /Disable
schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\DiskFootprint\Diagnostics" /Disable
schtasks /Change /TN "Microsoft\Windows\DiskFootprint\StorageSense" /Disable
schtasks /Change /TN "Microsoft\Windows\DUSM\dusmtask" /Disable
schtasks /Change /TN "Microsoft\Windows\EnterpriseMgmt\MDMMaintenenceTask" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClient" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\FileHistory\File History (maintenance mode)" /Disable
schtasks /Change /TN "Microsoft\Windows\Flighting\FeatureConfig\ReconcileFeatures" /Disable
schtasks /Change /TN "Microsoft\Windows\Flighting\FeatureConfig\UsageDataFlushing" /Disable
schtasks /Change /TN "Microsoft\Windows\Flighting\FeatureConfig\UsageDataReporting" /Disable
schtasks /Change /TN "Microsoft\Windows\Flighting\OneSettings\RefreshCache" /Disable
schtasks /Change /TN "Microsoft\Windows\Input\LocalUserSyncDataAvailable" /Disable
schtasks /Change /TN "Microsoft\Windows\Input\MouseSyncDataAvailable" /Disable
schtasks /Change /TN "Microsoft\Windows\Input\PenSyncDataAvailable" /Disable
schtasks /Change /TN "Microsoft\Windows\Input\TouchpadSyncDataAvailable" /Disable
schtasks /Change /TN "Microsoft\Windows\International\Synchronize Language Settings" /Disable
schtasks /Change /TN "Microsoft\Windows\LanguageComponentsInstaller\Installation" /Disable
schtasks /Change /TN "Microsoft\Windows\LanguageComponentsInstaller\ReconcileLanguageResources" /Disable
schtasks /Change /TN "Microsoft\Windows\LanguageComponentsInstaller\Uninstallation" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\License Manager\TempSignedLicenseExchange" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\License Manager\TempSignedLicenseExchange" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Management\Provisioning\Cellular" /Disable
schtasks /Change /TN "Microsoft\Windows\Management\Provisioning\Logon" /Disable
schtasks /Change /TN "Microsoft\Windows\Maintenance\WinSAT" /Disable
schtasks /Change /TN "Microsoft\Windows\Maps\MapsToastTask" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Maps\MapsUpdateTask" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Mobile Broadband Accounts\MNO Metadata Parser" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\MUI\LPRemove" /Disable
schtasks /Change /TN "Microsoft\Windows\NetTrace\GatherNetworkInfo" /Disable
schtasks /Change /TN "Microsoft\Windows\PI\Sqm-Tasks" /Disable
schtasks /Change /TN "Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /Disable
schtasks /Change /TN "Microsoft\Windows\PushToInstall\Registration" /Disable
schtasks /Change /TN "Microsoft\Windows\Ras\MobilityManager" /Disable
schtasks /Change /TN "Microsoft\Windows\RecoveryEnvironment\VerifyWinRE" /Disable
schtasks /Change /TN "Microsoft\Windows\RemoteAssistance\RemoteAssistanceTask" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\RetailDemo\CleanupOfflineContent" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Servicing\StartComponentCleanup" /Disable
schtasks /Change /TN "Microsoft\Windows\SettingSync\NetworkStateChangeTask" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Setup\SetupCleanupTask" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Setup\SnapshotCleanupTask" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\SpacePort\SpaceAgentTask" /Disable
schtasks /Change /TN "Microsoft\Windows\SpacePort\SpaceManagerTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Speech\SpeechModelDownloadTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Storage Tiers Management\Storage Tiers Management Initialization" /Disable
schtasks /Change /TN "Microsoft\Windows\Sysmain\ResPriStaticDbSync" /Disable
schtasks /Change /TN "Microsoft\Windows\Sysmain\WsSwapAssessmentTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Task Manager\Interactive" /Disable
schtasks /Change /TN "Microsoft\Windows\Time Synchronization\ForceSynchronizeTime" /Disable
schtasks /Change /TN "Microsoft\Windows\Time Synchronization\SynchronizeTime" /Disable
schtasks /Change /TN "Microsoft\Windows\Time Zone\SynchronizeTimeZone" /Disable
schtasks /Change /TN "Microsoft\Windows\TPM\Tpm-HASCertRetr" /Disable
schtasks /Change /TN "Microsoft\Windows\TPM\Tpm-Maintenance" /Disable
schtasks /Change /TN "Microsoft\Windows\UPnP\UPnPHostConfig" /Disable
schtasks /Change /TN "Microsoft\Windows\User Profile Service\HiveUploadTask" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\WDI\ResolutionHost" /Disable
schtasks /Change /TN "Microsoft\Windows\Windows Filtering Platform\BfeOnServiceStartTypeChange" /Disable
schtasks /Change /TN "Microsoft\Windows\WOF\WIM-Hash-Management" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\WOF\WIM-Hash-Validation" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Work Folders\Work Folders Logon Synchronization" /Disable
schtasks /Change /TN "Microsoft\Windows\Work Folders\Work Folders Maintenance Work" /Disable
schtasks /Change /TN "Microsoft\Windows\Workplace Join\Automatic-Device-Join" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\WwanSvc\NotificationTask" /Disable
schtasks /Change /TN "Microsoft\Windows\WwanSvc\OobeDiscovery" /Disable
schtasks /Change /TN "Microsoft\XblGameSave\XblGameSaveTask" /Disable


Disabling Printer Services and Tasks..
sc config PrintNotify start= disabled
sc config Spooler start= disabled
schtasks /Change /TN "Microsoft\Windows\Printing\EduPrintProv" /Disable 
schtasks /Change /TN "Microsoft\Windows\Printing\PrinterCleanupTask" /Disable 


Disabling Wifi Services and Tasks...
sc config NlaSvc start= disabled
sc config LanmanWorkstation start= disabled
sc config BFE start= demand >nul 2>&1
sc config Dnscache start= demand >nul 2>&1
sc config WinHttpAutoProxySvc start= demand >nul 2>&1
sc config Dhcp start= auto 
sc config DPS start= auto 
sc config lmhosts start= disabled
sc config nsi start= auto
sc config Wcmsvc start= disabled
sc config Winmgmt start= auto
sc config WlanSvc start= demand
reg add "HKLM\Software\Policies\Microsoft\Windows\NetworkConnectivityStatusIndicator" /v "NoActiveProbe" /t REG_DWORD /d "1" /f
reg add "HKLM\System\CurrentControlSet\Services\NlaSvc\Parameters\Internet" /v "EnableActiveProbing" /t REG_DWORD /d "0" /f
schtasks /Change /TN "Microsoft\Windows\WlanSvc\CDSSync" /Disable
schtasks /Change /TN "Microsoft\Windows\WCM\WiFiTask" /Disable
schtasks /Change /TN "Microsoft\Windows\NlaSvc\WiFiTask" /Disable
schtasks /Change /TN "Microsoft\Windows\DUSM\dusmtask" /Disable >nul 2>&1


Disabling Hyper-V Services...
sc config HvHost start=disabled 
sc config vmickvpexchange start=disabled 
sc config vmicguestinterface start=disabled 
sc config vmicshutdown start=disabled 
sc config vmicheartbeat start=disabled 
sc config vmicvmsession start=disabled 
sc config vmicrdv start=disabled 
sc config vmictimesync start=disabled 
sc config vmicvss start=disabled 

Disabling Browsers Services...
sc config edgeupdate start=disabled >nul 2>&1
sc config edgeupdatem start=disabled >nul 2>&1
sc config GoogleChromeElevationService start=disabled >nul 2>&1
sc config gupdate start=disabled >nul 2>&1
sc config gupdatem start=disabled >nul 2>&1
sc config BraveElevationService start=disabled >nul 2>&1
sc config brave start=disabled >nul 2>&1
sc config bravem start=disabled >nul 2>&1

Logitech
sc config logi_lamparray_service start=disabled >nul 2>&1

Removing Xbox Gaming Service...
powershell -command "get-appxpackage Microsoft.GamingServices | remove-AppxPackage -allusers" >nul 2>&1


Removing Microsoft Edge...
echo Stopping Edge Tasks.
taskkill /f /im msedge.exe >nul 2>&1
taskkill /f /im msedge.exe /fi "IMAGENAME eq msedge.exe" >nul 2>&1
taskkill /f /im msedge.exe /fi "IMAGENAME eq msedge.exe" >nul 2>&1
echo Deleting Edge Directories.
rd /s /q "C:\Program Files (x86)\Microsoft\Edge" >nul 2>&1
rd /s /q "C:\Program Files (x86)\Microsoft\EdgeCore" >nul 2>&1
rd /s /q "C:\Program Files (x86)\Microsoft\EdgeUpdate" >nul 2>&1
rd /s /q "C:\Program Files (x86)\Microsoft\EdgeWebView" >nul 2>&1
rd /s /q "C:\Program Files (x86)\Microsoft\Temp" >nul 2>&1
echo Deleting Microsoft Edge Shortcuts.
del "C:\Users\Public\Desktop\Microsoft Edge.lnk" >nul 2>&1
del "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Microsoft Edge.lnk" >nul 2>&1
del "%APPDATA%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Microsoft Edge.lnk" >nul 2>&1


Removing OneDrive...
echo Stopping OneDrive Tasks.
taskkill.exe /F /IM "OneDrive.exe"
taskkill.exe /F /IM "explorer.exe"
echo Removing OneDrive.
winget uninstall --silent --accept-source-agreements Microsoft.OneDrive >nul 2>&1
echo The operation completed successfully.
echo Removing OneDrive Shortcuts.
reg add "HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /v "System.IsPinnedToNameSpaceTree" /t REG_DWORD /d 0 /f
reg add "HKCR\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /v "System.IsPinnedToNameSpaceTree" /t REG_DWORD /d 0 /f
reg load "hku\Default" "C:\Users\Default\NTUSER.DAT"
reg delete "HKEY_USERS\Default\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "OneDriveSetup" /f >nul 2>&1
reg unload "hku\Default"
del /f /q "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\OneDrive.lnk" >nul 2>&1
schtasks /delete /tn "OneDrive*" /f >nul 2>&1
echo Restarting Explorer.
start explorer.exe
echo OneDrive deleted successfully.
timeout 1 > nul


Removing Widget and WidgetService...
echo Closing WidgetService and Widgets.
taskkill /F /IM WidgetService.exe >nul 2>&1
taskkill /F /IM Widgets.exe >nul 2>&1
echo Uninstalling Windows web experience Pack...
winget uninstall --silent --accept-source-agreements "Windows web experience Pack" >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\default\NewsAndInterests" /v "AllowNewsAndInterests" /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Dsh" /v "AllowNewsAndInterests" /t REG_DWORD /d 0 /f
CD /D "C:\Program Files\WindowsApps\MicrosoftWindows.Client.WebExperience_424.1301.450.0_x64__cw5n1h2txyewy\Dashboard" >nul 2>&1
echo echo %CD% >nul 2>&1
set "file1ToDelete=WidgetService.exe"
set "file2ToDelete=Widgets.exe"
if exist "%file1ToDelete%" (
    echo Taking ownership of %file1ToDelete%.
    takeown /F "%file1ToDelete%" >nul 2>&1
    echo Adjusting permissions for %file1ToDelete%.
    icacls "%file1ToDelete%" /grant administrators:F >nul 2>&1
    echo Removing %file1ToDelete%.
    del "%file1ToDelete%" /s /f /q
    echo %file1ToDelete% deleted successfully.
) else (
    echo File not found: %file1ToDelete%. >nul 2>&1
)
if exist "%file2ToDelete%" (
    echo.
    echo Taking ownership of %file2ToDelete%.
    takeown /F "%file2ToDelete%" >nul 2>&1
    echo Adjusting permissions for %file2ToDelete%.
    icacls "%file2ToDelete%" /grant administrators:F >nul 2>&1
    echo Removing %file2ToDelete%.
    del "%file2ToDelete%" /s /f /q
    echo %file2ToDelete% deleted successfully.
) else (
    echo File not found: %file2ToDelete%. >nul 2>&1


set regKeyGP=HKEY_CURRENT_USER\SOFTWARE\Microsoft\DirectX\UserGpuPreferences
set regKeyPR=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options
set regKeyFO=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers


:: Set Games to High Performance and Hgh Priority.
for /L %%i in (0, 1, 30) do (
    set "currentPath=!games[%%i]!"
    if exist "!currentPath!" (
        for %%a in (!currentPath!) do set "exeName=%%~nxa"
        echo Adding !exeName! to High Performance Mode, High Priority and FSO.
        reg add "%regKeyGP%" /v "!currentPath!" /t REG_SZ /d "GpuPreference=2" /f >nul 2>&1
        reg add "%regKeyPR%\!exeName!\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "3" /f >nul 2>&1
        reg add "%regKeyFO%" /v "!currentPath!" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE HIGHDPIAWARE" /f >nul 2>&1
    ) else (
        echo !currentPath! does not exist >nul 2>&1
    )
)

:: Set Apps to Power Saving and Low Priority.
for /L %%i in (0, 1, 19) do (
    set "currentPath=!apps[%%i]!"
    if exist "!currentPath!" (
        for %%a in (!currentPath!) do set "exeName=%%~nxa"
        echo Adding !exeName! to Power Saving Mode and Low Priority.
        reg add "%regKeyGP%" /v "!currentPath!" /t REG_SZ /d "GpuPreference=1" /f >nul 2>&1
        reg add "%regKeyPR%\!exeName!\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f >nul 2>&1 
    ) else (
        echo !currentPath! does not exist >nul 2>&1
    )
)



Nvidia Power Settings
echo Disabling Power Settings...
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{7B7A1E6E-0A7E-11EF-946A-806E6F6E6963}\0000" /v "PowerMizerEnable" /t REG_DWORD /d "1" /f 
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{7B7A1E6E-0A7E-11EF-946A-806E6F6E6963}\0000" /v "PowerMizerLevel" /t REG_DWORD /d "1" /f 
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{7B7A1E6E-0A7E-11EF-946A-806E6F6E6963}\0000" /v "PowerMizerLevelAC" /t REG_DWORD /d "1" /f 
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{7B7A1E6E-0A7E-11EF-946A-806E6F6E6963}\0000" /v "PerfLevelSrc" /t REG_DWORD /d "8738" /f
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak" /v "DisplayPowerSaving" /t Reg_DWORD /d "0" /f 
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e96c-e325-11ce-bfc1-08002be10318}\0001\PowerSettings" /v IdlePowerState /t REG_BINARY /d 00000000 /f
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Class{4d36e96c-e325-11ce-bfc1-08002be10318}\0000" /v "DisableDynamicPstate" /t REG_DWORD /d "1" /f


Nvidia Telemetry
echo Disabling Nvidia Telemetry...
REG ADD "HKLM\SOFTWARE\NVIDIA Corporation\NvControlPanel2\Client" /v "OptInOrOutPreference" /t REG_DWORD /d 0 /f 
REG ADD "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID44231" /t REG_DWORD /d 0 /f 
REG ADD "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID64640" /t REG_DWORD /d 0 /f 
REG ADD "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID66610" /t REG_DWORD /d 0 /f 
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v "EnableRID61684" /t REG_DWORD /d "1" /f
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\Startup" /v "SendTelemetryData" /t REG_DWORD /d 0 /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "NvBackend" /f >nul 2>&1


Running File Cleanup...
del "%LocalAppData%\Microsoft\Windows\INetCache\." /s /f /q
del "%temp%" /s /f /q
del "%AppData%\Discord\Cache\." /s /f /q
del "%AppData%\Discord\Code Cache\." /s /f /q
del "%ProgramData%\USOPrivate\UpdateStore" /s /f /q
del "%ProgramData%\USOShared\Logs" /s /f /q
del "C:\Windows\System32\SleepStudy" /s /f /q
rmdir /S /Q "%LocalAppData%\Microsoft\Windows\WebCache"
rd "%AppData%\Discord\Cache" /s /q
rd "%AppData%\Discord\Code Cache" /s /q
del "%WINDIR%\Logs" /s /f /q
rd /s /q %LocalAppData%\Temp
Del /S /F /Q %temp%
Del /S /F /Q %Windir%\Temp
Del /S /F /Q C:\WINDOWS\Prefetch
