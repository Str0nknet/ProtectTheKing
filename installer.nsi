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
    File /oname=$INSTDIR\Protect_The_King.exe "Protect_The_King.exe"

    ; Kopiowanie raylib.dll
    File /oname=$INSTDIR\raylib.dll "raylib.dll"

    ; Upewnienie się, że katalog Assets istnieje
    CreateDirectory "$INSTDIR\Assets"

    ; Kopiowanie całego folderu Assets, w tym ukrytych plików
    SetOutPath "$INSTDIR\Assets"
    File /r /x ".gitkeep" "Assets\*.*"

    ; Tworzenie podfolderów w Assets
    CreateDirectory "$INSTDIR\Assets\Icons"
    CreateDirectory "$INSTDIR\Assets\Mobs"
    CreateDirectory "$INSTDIR\Assets\Buttons"

    ; Kopiowanie ikony
    File /oname=$INSTDIR\Assets\Icons\Icon.ico "Assets\Icons\Icon.ico"

    ; Tworzenie skrótów
    CreateShortcut "$DESKTOP\Protect The King.lnk" "$INSTDIR\Protect_The_King.exe" "" "$INSTDIR\Assets\Icons\Icon.ico"
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
