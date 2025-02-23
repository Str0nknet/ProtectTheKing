; Installer script for Protect The King
!define APPNAME "Protect The King"
!define COMPANY "Str0nknetGames"
!define VERSION "0.0.1"

Outfile "ProtectTheKing_Installer.exe"  ; Nazwa pliku instalatora
InstallDir "$PROGRAMFILES\${APPNAME}"   ; Katalog domyślny instalacji
RequestExecutionLevel admin             ; Wymagaj uprawnień administratora
ShowInstDetails show                    

Section "Install"
    SetOutPath $INSTDIR

    ; Kopiowanie plików gry
    File /r "ProtectTheKing.exe"
    File /r "Assets\*.*"

    ; Tworzenie skrótu na pulpicie
    CreateShortcut "$DESKTOP\Protect The King.lnk" "$INSTDIR\ProtectTheKing.exe"

    ; Tworzenie skrótu w menu Start
    CreateDirectory "$SMPROGRAMS\${APPNAME}"
    CreateShortcut "$SMPROGRAMS\${APPNAME}\Protect The King.lnk" "$INSTDIR\ProtectTheKing.exe"

    ; Tworzenie deinstalatora
    WriteUninstaller "$INSTDIR\uninstall.exe"
SectionEnd

Section "Uninstall"
    Delete "$INSTDIR\ProtectTheKing.exe"
    RMDir /r "$INSTDIR\Assets"
    Delete "$INSTDIR\uninstall.exe"
    Delete "$DESKTOP\Protect The King.lnk"
    Delete "$SMPROGRAMS\${APPNAME}\Protect The King.lnk"
    RMDir /r "$SMPROGRAMS\${APPNAME}"
    RMDir /r "$INSTDIR"
SectionEnd
