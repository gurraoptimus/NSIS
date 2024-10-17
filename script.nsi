!include "MUI.nsh"

Name "pymp"
InstallDir "$PROGRAMFILES\pymp"
OutFile "install.exe"

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "LICENSE.txt"
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_LANGUAGE "Swedish"

Section ""
    SetOutPath $$INSTDIR
    File "LICENSE"
SectionEnd