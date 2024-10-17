!include "MUI.nsh"

!define MUI_ICON "io.ico"

Name "PYmediaPlayer"
InstallDir "$PROGRAMFILES\pymp"
OutFile "Installer.exe"
BrandingText "{Gurraoptimus Development}"

!define MUI_HEADERIMAGE
#!define MUI_HEADERIMAGE_BITMAP "file.bmp"
#!define MUI_WELCOMEFINISHPAGE_BITMAP "file.bmp"

!define MUI_PAGE_HEADER_TEXT "PYmediaPlayer"
!define MUI_WELCOMEPAGE_TEXT "A simple video player and Music."
!define MUI_PAGE_HEADER_SUBTEXT "Copyright (c) 2024  {G} Gurraoptimus This application is open-source software licensed under the MIT License."

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "LICENSE.txt"
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

#!insertmacro MUI_LANGUAGE "Swedish"
!insertmacro MUI_LANGUAGE "English"

Section ""
    SetOutPath $INSTDIR
    
    WriteRegStr root_key "subkey" "key_name" "value"

    file "LICENSE.txt"
    file "pymp.exe"
    file "io.ico"
SectionEnd