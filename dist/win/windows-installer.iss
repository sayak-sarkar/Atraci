; Installer Variables
#define AppName "Atraci"
#define AppVersion "0.6.0"
#define AppPublisher "Atraci Team"
#define AppURL "http://getatraci.net"
#define AppExeName "run.bat"


[Setup]
; DON'T FUCK WITH THE APPID. This uniquely identifies this application, which is used to find the app if we need to update it.
AppId={{F4B2C5C1-F084-4858-B9C3-E641F5C12BBC}

AppName={#AppName}
AppVersion={#AppVersion}
AppVerName={#AppName} {#AppVersion}
AppPublisher={#AppPublisher}
AppPublisherURL={#AppURL}
AppSupportURL={#AppURL}
AppUpdatesURL={#AppURL}

; Make the Installer nicer and Minimalistic
WizardImageFile=.\installer-image.bmp
WindowResizable=no

; Don't ask for a install folder (it goes into \Users\Username\AppData\Roaming\Atraci\, which doesn't require admin privileges)
UsePreviousAppDir=no
DefaultDirName={userappdata}\Atraci

; No Start Menu Folder picker (It's always created)
DefaultGroupName={#AppName}
DisableProgramGroupPage=yes

; We just need a Welcome Page and a Finish page. Nothing else.
DisableReadyPage=yes
DisableFinishedPage=no
DisableWelcomePage=no

; No UAC bullshit
PrivilegesRequired=lowest
; Put the uninstaller in the same folder, or else it'll go into Program Files, which requires Admin Privileges
UninstallFilesDir={app}

; Use the same language as the user (or ask otherwise)
ShowLanguageDialog=no

; Compress the files nicely
Compression=lzma2
SolidCompression=yes

; Final Installer
OutputBaseFilename=Install {#AppName} {#AppVersion}
SetupIconFile=..\..\images\atraci.ico
OutputDir=.\


[Languages]
Name: "en"; MessagesFile: ".\languages\English.isl"


[Files]
Source: ".\run.bat"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\index.html"; DestDir: "{app}\app\"; Flags: ignoreversion
Source: "..\..\package.json"; DestDir: "{app}\app\"; Flags: ignoreversion
Source: "..\..\featured-music\*"; DestDir: "{app}\app\featured-music\"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\..\l10n\*"; DestDir: "{app}\app\l10n\"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\..\css\*"; DestDir: "{app}\app\css\"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\..\fonts\*"; DestDir: "{app}\app\fonts\"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\..\js\*"; DestDir: "{app}\app\js\"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\..\images\*"; DestDir: "{app}\app\images\"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\..\node_modules\node-uuid\*"; DestDir: "{app}\app\node_modules\node-uuid\"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\..\node_modules\request\*"; DestDir: "{app}\app\node_modules\request\"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\..\node_modules\universal-analytics\*"; DestDir: "{app}\app\node_modules\universal-analytics\"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\..\node_modules\ytdl\*"; DestDir: "{app}\app\node_modules\ytdl\"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\..\node-webkit\win\*"; DestDir: "{app}\node-webkit\"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files


[Icons]
; Add an Icon in the app folder as a reference
Name: "{app}\{#AppName}"; WorkingDir: "{app}"; Filename: "{app}\node-webkit\nw.exe"; Parameters:"""{app}\app"""; IconFilename: "{app}\app\images\atraci.ico"; Flags: runminimized preventpinning
; Another in the group (this one can be featured)
Name: "{group}\{#AppName}"; WorkingDir: "{app}"; Filename: "{app}\node-webkit\nw.exe"; Parameters:"""{app}\app"""; IconFilename: "{app}\app\images\atraci.ico"; Flags: runminimized
; Another in the desktop
Name: "{commondesktop}\{#AppName}"; WorkingDir: "{app}"; Filename: "{app}\node-webkit\nw.exe"; Parameters:"""{app}\app"""; IconFilename: "{app}\app\images\atraci.ico"; Flags: runminimized preventpinning


[Run]
; Run the app after installing
Filename: "{app}\node-webkit\nw.exe"; Parameters: """{app}\app"""; Description: "{cm:LaunchProgram,{#StringChange(AppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent runminimized

