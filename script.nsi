!include "MUI.nsh"

!define MUI_ICON "io.ico"
!define MUI_HEADERIMAGE
!define MUI_PAGE_HEADER_TEXT "PYmediaPlayer"
!define MUI_WELCOMEPAGE_TEXT "A simple video player and Music."
!define MUI_PAGE_HEADER_SUBTEXT "Copyright (c) 2024  {G} Gurraoptimus This application is open-source software licensed under the MIT License."

#!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "file.bmp"
!define MUI_WELCOMEFINISHPAGE_BITMAP "file.bmp"

Name "PYmediaPlayer"
InstallDir "$PROGRAMFILES\pymp"
OutFile "Installer.exe"
BrandingText "{Gurraoptimus Development}"

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "LICENSE.txt"
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_WELCOME
!insertmacro MUI_UNPAGE_DIRECTORY
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH

#!insertmacro MUI_LANGUAGE "Swedish"
!insertmacro MUI_LANGUAGE "English"

Section ""
    SetOutPath $INSTDIR
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\pymp" "DisplayName" "PYmediaPlayer"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\pymp" "DisplayVersion" "1.0.0"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\pymp" "Publisher" "{Gurraoptimus Development}"
    WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\pymp" "DisplayIcon" "$INSTDIR\io.ico"
    WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\pymp" "NoModify" 1
    WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\pymp" "NoRepair" 1
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\pymp" "UninstallString" "$INSTDIR\Uninstall.exe"
    File "LICENSE.txt"
    File "io.ico"
    WriteUninstaller "$INSTDIR\Uninstall.exe"
SectionEnd

Section "PYmediaPlayer"
    SetOutPath $INSTDIR
    File "pymp.exe"
    CreateShortcut "$DESKTOP\PYmediaPlayer.lnk" "$INSTDIR\pymp.exe" "" "$INSTDIR\io.ico" 0
SectionEnd

Section "Uninstall"
    Delete "$INSTDIR\LICENSE.txt"
    Delete "$INSTDIR\pymp.exe"
    Delete "$INSTDIR\io.ico"
    Delete "$SMPROGRAMS\PYmediaPlayer\PYmediaPlayer.lnk"
    Delete "$INSTDIR\Uninstall.exe"
    Delete "$DESKTOP\PYmediaPlayer.lnk"
    DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\pymp"
SectionEnd
