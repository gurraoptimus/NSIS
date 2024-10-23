!include "MUI.nsh"


!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PyMediaPlayer}"
!define PRODUCT_NAME "PyMediaPlayer"
!define PRODUCT_VERSION "1.0.0"
!define PRODUCT_PUBLISHER "GurraOptimus Development"
!define PRODUCT_URL "https://www.gurraoptimus.se/pymp"

!define MUI_ICON "io.ico"
!define MUI_HEADERIMAGE
!define MUI_PAGE_HEADER_TEXT "PyMediaPlayer"
#!define MUI_WELCOMEPAGE_TEXT "A simple video player and Music."
!define MUI_PAGE_HEADER_SUBTEXT "open-source software licensed under the MIT License."
#!define MUI_HEADERIMAGE_BITMAP "file.bmp"
!define MUI_WELCOMEFINISHPAGE_BITMAP "welcome.bmp"

Name "PyMediaPlayer"
InstallDir "$PROGRAMFILES\pymp"
OutFile "PyMediaPlayer.exe"
BrandingText "{GurraOptimus Development}"
RequestExecutionLevel admin


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
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\pymp" "DisplayName" "PyMediaPlayer"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\pymp" "DisplayVersion" "1.0.0"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\pymp" "Publisher" "GurraOptimus Development"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\pymp" "PRODUCT_URL" "https://gurraoptimus.se"
    WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\pymp" "DisplayIcon" "$INSTDIR\io.ico"
    WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\pymp" "NoModify" 1
    WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\pymp" "NoRepair" 1
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\pymp" "UninstallString" "$INSTDIR\Uninstall.exe"
    File "LICENSE.txt"
    File "io.ico"
    File "readme.md"
    WriteUninstaller "$INSTDIR\Uninstall.exe"
SectionEnd

Section "PyMediaPlayer" SEC01
    SetOutPath $INSTDIR
    File "pymp.exe"
    # Open the URL after installation
    
    ;ExecShell "open" "${PRODUCT_URL}"
    
    MessageBox MB_OK "pymp.exe found!"
    ExecShell "open" "$INSTDIR\pymp.exe" "INSTDIR"
    CreateShortcut "$DESKTOP\PyMediaPlayer.lnk" "$INSTDIR\pymp.exe" "" "$INSTDIR\io.ico" 0
SectionEnd

Section "codecguide"
    SetOutPath $INSTDIR 
    file "K-Lite_Codec_Pack_1860_Standard.exe"
      ; Check if the file exists
     ExecShell "open" "$INSTDIR\K-Lite_Codec_Pack_1860_Standard.exe" "INSTDIR"
     ; IfFileExists "$INSTDIR\K-Lite_Codec_Pack_1860_Standard.exe" 0 +2
    
    MessageBox MB_OK "K-Lite_Codec_Pack_1860_Standard.exe found!"
    CreateShortcut "$DESKTOP\Codec_1860.lnk" "$INSTDIR\K-Lite_Codec_Pack_1860_Standard.exe"
SectionEnd

Section "Uninstall"
    RMDir /r /REBOOTOK "C:\Program Files (x86)\pymp"
    Delete "$INSTDIR\readme.md"
    Delete "$INSTDIR\LICENSE.txt"
    Delete "$INSTDIR\pymp.exe"
    Delete "$INSTDIR\io.ico"
    Delete "$INSTDIR\K-Lite_Codec_Pack_1860_Standard.exe"
    Delete "$SMPROGRAMS\K-Lite_Codec_Pack_1860_Standard\Codec_1860.lnk"
    Delete "$SMPROGRAMS\PyMediaPlayer\PyMediaPlayer.lnk"
    Delete "$INSTDIR\Uninstall.exe"
    Delete "$DESKTOP\PyMediaPlayer.lnk"
    Delete "$DESKTOP\Codec_1860.lnk"
    
    DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\pymp"
SectionEnd
