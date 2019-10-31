[Setup]
SourceDir=Z:\Projects\GetHtml
AppName=GetHtml
AppVerName=GetHtml v1.0.47 Alpha Release
DefaultDirName={pf}\Deciacco.com\GetHtml
DefaultGroupName=Deciacco.com\GetHtml
OutputDir=Z:\Projects\GetHtml\Setup
OutputBaseFilename=gethtmlsetup
AppCopyright=Copyright © 2006 Deciacco.com
PrivilegesRequired=admin
DisableProgramGroupPage=false
ShowLanguageDialog=no
MinVersion=0,5.0.2195sp3
DisableReadyPage=true
AlwaysUsePersonalGroup=true
LicenseFile=license.txt
InfoAfterFile=readme.txt

[Tasks]
Name: desktopicon; Description: {cm:CreateDesktopIcon}; GroupDescription: {cm:AdditionalIcons}; Flags: unchecked

[Files]
Source: gethtml.exe; DestDir: {app}; Flags: replacesameversion
Source: Setup\gethtml.ini; DestDir: {app}; Flags: confirmoverwrite; Tasks: 
Source: readme.txt; DestDir: {app}
Source: license.txt; DestDir: {app}

; Microsoft Graphics Device Interface Plus (GDI+) DLL
Source: Z:\Projects\VFP9Distrib\gdiplus.dll; DestDir: {cf}\Microsoft Shared\VFP; Flags: sharedfile uninsneveruninstall restartreplace

; Microsoft Visual C++ 7.1 Runtime DLL
Source: Z:\Projects\VFP9Distrib\msvcr71.dll; DestDir: {cf}\Microsoft Shared\VFP; Flags: onlyifdoesntexist deleteafterinstall
Source: Z:\Projects\VFP9Distrib\msvcr71.dll; DestDir: {app}; Flags: onlyifdoesntexist

; Microsoft Visual FoxPro 9.0 Runtime Support Libraries
Source: Z:\Projects\VFP9Distrib\vfp9r.dll; DestDir: {cf}\Microsoft Shared\VFP; Flags: regserver sharedfile uninsneveruninstall onlyifdoesntexist
Source: Z:\Projects\VFP9Distrib\vfp9t.dll; DestDir: {cf}\Microsoft Shared\VFP; Flags: sharedfile uninsneveruninstall onlyifdoesntexist
Source: Z:\Projects\VFP9Distrib\vfp9renu.dll; DestDir: {cf}\Microsoft Shared\VFP; Flags: sharedfile uninsneveruninstall onlyifdoesntexist
;Source: C:\WINDOWS\system32\mswinsck.ocx; DestDir: {sys}; Flags: restartreplace sharedfile regserver
Source: C:\WINDOWS\system32\richtx32.ocx; DestDir: {sys}; Flags: restartreplace sharedfile regserver

[Icons]
Name: {group}\GetHtml; Filename: {app}\gethtml.exe; WorkingDir: {app}
Name: {group}\Ini Edit; Filename: {app}\gethtml.ini
Name: {group}\{cm:UninstallProgram,GetHtml}; Filename: {uninstallexe}
Name: {userdesktop}\GetHtml; Filename: {app}\gethtml.exe; WorkingDir: {app}; Comment: GetHtml; Flags: createonlyiffileexists; IconIndex: 0; Tasks: desktopicon
