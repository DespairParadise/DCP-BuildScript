#define MyAppName "Despair Codec Pack"
#define MyAppVersion "2.0.0-akane"
#define MyAppPublisher "Despair-Paradise"
#define MyAppURL "https://codec.despair-paradise.com/"
#define MyAppExeName "MPC-BE\mpc-be64.exe"
#define DespairPlayer "Despair Codec Player"
#define DespairName "Despair Codec Pack - Settings"
#define DespairNameExe "Config\DCP-Core.exe"
#define DespairIcon "despair.ico"
#define SyncplayName "Syncplay"
#define SyncplayNameExe "Syncplay\syncplay.exe"

[Setup]
AppId={{C927D6E7-07CF-490E-9C7C-54ACC1772686}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DisableProgramGroupPage=yes
OutputDir=Output
OutputBaseFilename=dcp_2.0.0_setup-fr
Compression=lzma
SolidCompression=yes
ArchitecturesInstallIn64BitMode=x64
PrivilegesRequired=admin

[Languages]
Name: "en"; MessagesFile: "compiler:Default.isl"
Name: "fr"; MessagesFile: "compiler:Languages\French.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"

[Files]
Source: "Extracted\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; AfterInstall: SetupReg
Source: "Extracted\Config\eng\*"; DestDir: "{app}\Config"; Flags: ignoreversion recursesubdirs createallsubdirs;
Source: "Extracted\Config\fra\*"; DestDir: "{app}\Config"; Flags: ignoreversion recursesubdirs createallsubdirs; Languages: fr
Source: "Extracted\SyncPlay\syncplay.ini"; DestDir: "{app}\SyncPlay"; Flags: ignoreversion; Permissions: everyone-full 

[Icons]
Name: "{commonprograms}\{#MyAppName}\{#DespairPlayer}"; Filename: "{app}\{#MyAppExeName}"
Name: "{commonprograms}\{#MyAppName}\{#DespairName}"; Filename: "{app}\{#DespairNameExe}"; IconFilename: "{app}\{#DespairIcon}"
Name: "{commonprograms}\{#MyAppName}\{#SyncplayName}"; Filename: "{app}\{#SyncplayNameExe}";
Name: "{commondesktop}\{#DespairPlayer}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon
Name: "{commondesktop}\Syncplay"; Filename: "{app}\{#SyncplayNameExe}"; Tasks: desktopicon

[Run]
Filename: "reg"; Parameters: "delete HKEY_CURRENT_USER\Software\madshi\madVR /f"; Flags: runhidden; StatusMsg: "Removing old register entries..."
Filename: "reg"; Parameters: "delete HKEY_CURRENT_USER\Software\MPC-BE /f"; Flags: runhidden; StatusMsg: "Removing old register entries..."
Filename: "{sys}\regsvr32.exe"; Parameters: "/s LAVFilters\LAVSplitter.ax"; WorkingDir: "{app}"; Flags: runhidden; StatusMsg: "Installing LAV Filters..."
Filename: "{sys}\regsvr32.exe"; Parameters: "/s LAVFilters\LAVVideo.ax"; WorkingDir: "{app}"; Flags: runhidden; StatusMsg: "Installing LAV Filters..."
Filename: "{sys}\regsvr32.exe"; Parameters: "/s LAVFilters\LAVAudio.ax"; WorkingDir: "{app}"; Flags: runhidden; StatusMsg: "Installing LAV Filters..."
Filename: "{sys}\regsvr32.exe"; Parameters: "/s XySubFilter\XySubFilter.dll"; WorkingDir: "{app}"; Flags: runhidden; StatusMsg: "Installing XySubFilter..."
Filename: "{sys}\regsvr32.exe"; Parameters: "/s madVR\madVR.ax"; WorkingDir: "{app}"; Flags: runhidden; StatusMsg: "Installing madVR..."
Filename: "{sys}\regsvr32.exe"; Parameters: "/s madVR\madVR64.ax"; WorkingDir: "{app}"; Flags: runhidden; StatusMsg: "Installing madVR..."
Filename: "C:\Windows\regedit.exe"; Parameters: "/s Config\mpc-be-settings.reg"; WorkingDir: "{app}"; Flags: runhidden; StatusMsg: "Setting up MPC-BE..."
Filename: "C:\Windows\regedit.exe"; Parameters: "/s Config\mod_alwaysLoadXySubFilter.reg"; WorkingDir: "{app}"; Flags: runhidden; StatusMsg: "Setting up XySubFilter..." 
Filename: "{sys}\icacls.exe"; Parameters: "SyncPlay\syncplay.ini /grant *S-1-5-32-545:(OI)(CI)F"; WorkingDir: "{app}"; Flags: runhidden; StatusMsg: "Setting up Syncplay..."
Filename: "{app}\Config\DCP-OneTime.exe"; Flags: runascurrentuser; StatusMsg: "Hashire Sori yo..."
Filename: "{app}\MPC-BE\mpc-be64.exe"; Parameters: "/adminoption 10027"; Flags: runascurrentuser; StatusMsg: "...PADORU PADORU"
 
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[Code]
procedure SetupReg();
begin
     RegWriteStringValue(HKEY_CURRENT_USER, 'Software\Despair Codec Pack',
    'InstallPath', ExpandConstant('{app}'));
     RegWriteStringValue(HKEY_CURRENT_USER, 'Software\Despair Codec Pack',
    'Version', ExpandConstant('{#MyAppVersion}'));
end;
