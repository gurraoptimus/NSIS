!include "MUI.nsh"

!define PRODUCT_NAME "PyMediaPlayer"
!define PRODUCT_VERSION "1.1.0"
!define PRODUCT_PUBLISHER "Gurraoptimus Development"
!define PRODUCT_URL "gurraoptimus.se/open-source"
!define MUI_ICON "io.ico"
!define MUI_PAGE_HEADER_TEXT "PyMediaPlayer"
!define MUI_PAGE_HEADER_SUBTEXT "Open-source software licensed under the MIT License. ${PRODUCT_URL} "
!define MUI_HEADERIMAGE
!define MUI_WELCOMEFINISHPAGE_BITMAP "welcome.bmp"

Name "${PRODUCT_NAME}"
InstallDir "$PROGRAMFILES\pymp"
OutFile "PyMediaPlayer_Update.exe"
BrandingText "{Gurraoptimus Development}"
RequestExecutionLevel admin

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "LICENSE.txt"
;!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH
!insertmacro MUI_LANGUAGE "English"
;!insertmacro MUI_LANGUAGE "Swedish"
;!insertmacro MUI_LANGUAGE "korean"

Section ""
    ReadRegStr $R0 HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\pymp" "DisplayVersion"
    StrCmp $R0 "" InstallNew UpdateExisting

InstallNew:
    MessageBox MB_OK "Installing PyMediaPlayer ${PRODUCT_VERSION}."

UpdateExisting:
    MessageBox MB_YESNO "PyMediaPlayer $R0 is already installed. Update to ${PRODUCT_VERSION}?" IDNO EndInstall

    ; Installation steps
    SetOutPath $INSTDIR
    File "LICENSE.txt"
    File "io.ico"
    File "readme.md"
    File "pymp.exe"
    
    ; Shortcuts
    CreateShortcut "$DESKTOP\PyMediaPlayer.lnk" "$INSTDIR\pymp.exe" "" "$INSTDIR\io.ico" 0
    CreateShortcut "$DESKTOP\Codec.lnk" "$INSTDIR\Codec_1870.exe"

    ; Install Codec Pack Silently
    File "Codec_1870.exe"
    ExecWait '"$INSTDIR\Codec_1870.exe" /verysilent /norestart'
    WriteUninstaller "$INSTDIR\Uninstall.exe"

    ; Registry Updates
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\pymp" "DisplayName" "${PRODUCT_NAME}"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\pymp" "DisplayVersion" "${PRODUCT_VERSION}"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\pymp" "Publisher" "${PRODUCT_PUBLISHER}"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\pymp" "UninstallString" "$INSTDIR\Uninstall.exe"

    ; Movies Directory
    SetOutPath "$INSTDIR\Movies"
    CreateDirectory "$INSTDIR\Movies"
    File "Intro.mp4"

    MessageBox MB_OK "${PRODUCT_NAME} has been installed/updated successfully!"
    Goto EndInstall

EndInstall:
SectionEnd

Section "Uninstall"
    MessageBox MB_YESNO "Are you sure you want to uninstall ${PRODUCT_NAME}?" IDNO AbortUninstall

    ; Remove directories
    RMDir /r "$INSTDIR"

    ; Delete shortcuts
    Delete "$DESKTOP\PyMediaPlayer.lnk"
    Delete "$DESKTOP\Codec.lnk"

    ; Registry cleanup
    DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\pymp"

    MessageBox MB_OK "${PRODUCT_NAME} has been uninstalled."
AbortUninstall:
SectionEnd
