!include "MUI.nsh"

#!define MUI_ICON "io.ico"

Name "PYmediaPlayer"
InstallDir "$PROGRAMFILES\pymp"
OutFile "setup.exe"
BrandingText "{Gurraoptimus Development}"

!define MUI_HEADERIMAGE

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "LICENSE.txt"
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_LANGUAGE "Swedish"

Section ""
    SetOutPath $INSTDIR
    File "LICENSE.txt"
    file "pymp.exe"
    file "io.ico"
SectionEnd