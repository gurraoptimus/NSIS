!include "MUI.nsh"

!define MUI_ICON "io.ico"

Name "PYmediaPlayer"
InstallDir "$PROGRAMFILES\pymp"
OutFile "Installer.exe"
BrandingText "{Gurraoptimus Development}"

!define MUI_HEADERIMAGE
#!define MUI_HEADERIMAGE_BITMAP "io.ico"

!define MUI_PAGE_HEADER_TEXT "PYmediaPlayer"
!define MUI_WELCOMEPAGE_TEXT "A simple video player and Music. This application is open-source software licensed under the MIT License."
!define MUI_PAGE_HEADER_SUBTEXT "Copyright (c) Gurraoptimus Development All rights reserved..."

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "LICENSE.txt"
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

#!insertmacro MUI_LANGUAGE "Swedish"
!insertmacro MUI_LANGUAGE "English"

Section ""
    SetOutPath $INSTDIR
    file "LICENSE.txt"
    file "pymp.exe"
    file "io.ico"
SectionEnd