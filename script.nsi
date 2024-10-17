# Name of the installer
OutFile "setup.exe"

# Installation directory
InstallDir "$PROGRAMFILES\MyApp"

# Default section
Section "MainSection" SEC01
    # Set output path to the installation directory
    SetOutPath "$INSTDIR"
    
    # File to install
    File "MyApp.exe"
    File "MyApp.dll"
    File "README.txt"

    # Create a shortcut in the Start Menu
    CreateShortcut "$SMSTARTUP\MyApp.lnk" "$INSTDIR\MyApp.exe"
    
    # Optionally create a shortcut on the Desktop
    CreateShortcut "$DESKTOP\MyApp.lnk" "$INSTDIR\MyApp.exe"
SectionEnd

# Uninstall section
Section "Uninstall"
    # Remove installed files
    Delete "$INSTDIR\MyApp.exe"
    Delete "$INSTDIR\MyApp.dll"
    Delete "$INSTDIR\README.txt"
    
    # Remove shortcuts
    Delete "$SMSTARTUP\MyApp.lnk"
    Delete "$DESKTOP\MyApp.lnk"
    
    # Remove the installation directory
    RMDir "$INSTDIR"
SectionEnd

# Welcome page
!insertmacro MUI_PAGE_WELCOME
# License page (optional)
!insertmacro MUI_PAGE_LICENSE "LICENSE.txt"
# Directory selection page
!insertmacro MUI_PAGE_DIRECTORY
# Install page
!insertmacro MUI_PAGE_INSTFILES
# Finish page
!insertmacro MUI_PAGE_FINISH

# Uninstaller
!insertmacro MUI_UNFINISH
