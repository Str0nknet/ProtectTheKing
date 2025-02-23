; Installer script for Protect The King
!define APPNAME "Protect The King"
!define COMPANY "MyGameStudio"
!define VERSION "1.0"

; Domyślny katalog instalacyjny (bez dodatkowych parametrów)
InstallDir "$PROGRAMFILES\${APPNAME}"

Outfile "ProtectTheKing_Installer.exe" ; Nazwa pliku instalatora
RequestExecutionLevel admin ; Wymagaj uprawnień administratora
ShowInstDetails show

Section "Install"
    SetOutPath $INSTDIR

    ; Kopiowanie plików gry
    File /r "ProtectTheKing.exe"
    File /r "Assets\*.*"

    ; Skrót na pulpicie
    CreateShortcut "$DESKTOP\Protect The King.lnk" "$INSTDIR\ProtectTheKing.exe"

    ; Skrót w menu start
    CreateDirectory "$SMPROGRAMS\${APPNAME}"
    CreateShortcut "$SMPROGRAMS\${APPNAME}\Protect The King.lnk" "$INSTDIR\ProtectTheKing.exe"

    ; Dodanie deinstalatora
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

