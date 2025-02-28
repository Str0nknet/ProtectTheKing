!define VERSION "0.0.1"
!define APPNAME "ProtectTheKing"

Outfile "ProtectTheKing_Installer.exe"  ; Nazwa pliku instalatora
InstallDir "$PROGRAMFILES\${APPNAME}"   ; Katalog domyślny instalacji
RequestExecutionLevel admin             ; Wymagaj uprawnień administratora
ShowInstDetails show

; Ustawienie ikony dla instalatora
Icon "Assets\Icons\Icon.ico"
UninstallIcon "Assets\Icons\Icon.ico"

Section "Install"
    SetOutPath $INSTDIR

    ; Kopiowanie plików gry
    File "Protect_The_King.exe"
    
    ; Kopiowanie folderu Assets z całą strukturą
    SetOutPath "$INSTDIR\Assets"
    File /r "Assets\*"

    ; Kopiowanie raylib.dll
    SetOutPath $INSTDIR
    File "raylib.dll"

    ; Kopiowanie ikony do katalogu instalacyjnego
    SetOutPath "$INSTDIR\Assets\Icons"
    File "Assets\Icons\Icon.ico"

    ; Tworzenie skrótu na pulpicie z ikoną
    CreateShortcut "$DESKTOP\Protect The King.lnk" "$INSTDIR\Protect_The_King.exe" "" "$INSTDIR\Assets\Icons\Icon.ico"

    ; Tworzenie skrótu w menu Start z ikoną
    CreateDirectory "$SMPROGRAMS\${APPNAME}"
    CreateShortcut "$SMPROGRAMS\${APPNAME}\Protect The King.lnk" "$INSTDIR\Protect_The_King.exe" "" "$INSTDIR\Assets\Icons\Icon.ico"

    ; Tworzenie deinstalatora
    WriteUninstaller "$INSTDIR\uninstall.exe"
SectionEnd

Section "Uninstall"
    Delete "$INSTDIR\Protect_The_King.exe"
    RMDir /r "$INSTDIR\Assets"
    Delete "$INSTDIR\raylib.dll"
    Delete "$INSTDIR\uninstall.exe"
    Delete "$DESKTOP\Protect The King.lnk"
    Delete "$SMPROGRAMS\${APPNAME}\Protect The King.lnk"
    RMDir /r "$SMPROGRAMS\${APPNAME}"
    RMDir /r "$INSTDIR"
SectionEnd
